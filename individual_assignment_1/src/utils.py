import numpy as np
import matplotlib.pyplot as plt
from PIL import Image
from imageio import imread, imwrite
import glob


def visualize(img: np.array, mask: np.array, seam_color: np.array) -> np.array:
    vis = img.astype(np.uint8)
    vis[np.where(mask == False)] = seam_color
    return vis


def resize(img: np.array, width: int) -> np.array:
    h, w, c = img.shape
    dim = (width, int(h * width / float(w)))

    img_pil = Image.fromarray(img)
    img = img_pil.resize(dim)
    img = np.asarray(img)

    return img


def plot_time_consumption(log_time: np.array, config: dict):
    y = np.array(log_time)
    x = np.array([i + 1 for i in range(len(log_time))])
    plt.figure(0)
    plt.xlabel('Iteration')
    plt.ylabel('Duration')
    plt.plot(x, y, label='Time Consumption')
    plt.legend()
    plt.savefig(config['output_path'] + config['output_time'])


def load_file_order(config: dict) -> np.array:
    clips = []
    for infile in sorted(glob.glob(config['output_path'] + config['output_seam_name'] + '*.jpg')):
        img = imread(infile)
        clips.append(img)

    return clips


def make_full_seams(img: np.array, m: np.array, backtrack: np.array, config: dict):
    h, w, c = img.shape
    mask = np.ones((h, w), dtype=np.bool)
    for k in range(400):
        j = np.argmin(m[-1])
        m[-1, j] = np.inf
        # Traverse from bottom to top of the image to find the lowest cost seam.
        for i in range(h - 1, -1, -1):
            mask[i, j] = False
            j = backtrack[i, j]

    img_vis = visualize(img, mask, config['seam_color'])
    imwrite(config['output_path'] + config['output_full_seams'], img_vis)
