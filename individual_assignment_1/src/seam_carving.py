"""
Note: this code is adapted from these two repository.
Resource:
- https://karthikkaranth.me/blog/implementing-seam-carving-with-python/
- https://github.com/andrewdcampbell/seam-carving
"""

import time
from imageio import imread, imwrite
from scipy.ndimage.filters import convolve
from tqdm import trange

from utils import *


def comp_energy(img: np.array, path: str) -> np.array:
    """
    Compute energy map for the image.
    """

    # Check image dimensions
    h, w, c = img.shape
    assert c == 3, f'{c} is wrong input dimension'

    # Create convolution kernel of rows to compute vertical gradient for each channel.
    kernel_vertical = np.array([
        [1.0, 2.0, 1.0],
        [0.0, 0.0, 0.0],
        [-1.0, -2.0, -1.0]
    ])
    kernel_vertical = np.stack([kernel_vertical] * 3, axis=2)

    # Create convolution kernel of columns to compute horizontal gradient for each channel.
    kernel_horizontal = np.array([
        [1.0, 0.0, -1.0],
        [2.0, 0.0, -2.0],
        [1.0, 0.0, -1.0]
    ])
    kernel_horizontal = np.stack([kernel_horizontal] * 3, axis=2)

    img = img.astype('float32')
    # Apply formula 1.
    convolution = np.abs(convolve(img, kernel_vertical)) + np.abs(convolve(img, kernel_horizontal))

    # Sum up energy values cross RGB channels.
    energy_map = np.sum(convolution, axis=2)

    # Output energy map
    # imwrite(path, energy_map)

    return energy_map


def optimal_seam(img: np.array, energy_map: np.array) -> (np.array, np.array):
    """
    Find an 8-connected path of the pixels with the least energy.
    """
    h, w, c = img.shape

    # Create cumulative energy map M.
    m = energy_map.copy()
    # Create backtrack matrix to find the list of pixels which has the least energy cost.
    backtrack = np.zeros_like(m, dtype=np.int)

    # Traverse from the second row to the last one.
    for i in range(1, h):
        for j in range(0, w):
            # Deal with the left most column.
            if j == 0:
                index = np.argmin(m[i - 1, j: j + 2])
                backtrack[i, j] = index + j
                min_energy = m[i - 1, index + j]
            else:
                index = np.argmin(m[i - 1, j - 1: j + 2])
                backtrack[i, j] = index + j - 1
                min_energy = m[i - 1, index + j - 1]
            m[i, j] += min_energy

    return m, backtrack


def carve(img: np.array, m: np.array, backtrack: np.array) -> np.array:
    """
    Remove the seam with lowest energy cost.
    """
    h, w, c = img.shape

    # Create an image mask.
    mask = np.ones((h, w), dtype=np.bool)

    # Find the column with lowest energy cost in the last row.
    start_point = np.argmin(m[-1])
    j = start_point
    # Traverse from bottom to top of the image to find the lowest cost seam.
    for i in range(h - 1, -1, -1):
        mask[i, j] = False
        j = backtrack[i, j]

    return mask


def remove_seam(img: np.array, mask: np.array) -> np.array:
    h, w, c = img.shape

    # Convert mask to 3-channel array
    # (H, W, C)
    mask = np.stack([mask] * 3, axis=2)
    # (H, W, C)
    img = img[mask]
    # Reshape the generated image to new dimensions
    # (H, W-1, C)
    img = img.reshape((h, w - 1, c))

    return img


def crop_img(img: np.array, config: dict) -> (np.array, np.array):
    """
    Content-aware cropping using seam carving
    """
    h, w, c = img.shape
    new_w = int(config['rescale'] * w)
    log_time = []

    # Check if desired dimension is valid.
    assert new_w <= w, f'{new_w} must smaller or equal than the input image width'

    for i in trange(w - new_w):
        # Time consumption
        start_time = time.time()

        energy_map = comp_energy(img, config['output_path'] + config['output_energy_name'] + '_' + str(i) + '.jpg')
        m, backtrack = optimal_seam(img, energy_map)

        if i == 0:
            make_full_seams(img, m, backtrack, config)

        mask = carve(img, m, backtrack)

        if config['vis']:
            img_vis = visualize(img, mask, config['seam_color'])
            # imwrite(config['output_path'] + config['output_seam_name'] + '_' + str(i) + '.jpg', img_vis)

        img = remove_seam(img, mask)

        log_time.append(time.time() - start_time)

    return img, np.array(log_time)
