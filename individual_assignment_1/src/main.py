import os
import yaml
from PIL import Image

from seam_carving import *
from utils import *


# Load configuration
with open('../config.yml', 'r') as stream:
    try:
        config = yaml.safe_load(stream)
    except yaml.YAMLError as exc:
        print(exc)

# Create folders
# os.mkdir('../output/energy')
# os.mkdir('../output/seams')

# Load image
img = imread(config['input_path'] + config['input_name'])

# Downsize for fast cropping
if config['downsize']:
    img = resize(img, config['downsize_width'])
    imwrite(config['output_path'] + 'original_image.jpg', img)

# Content-aware image retargeting
output, log_time = crop_img(img, config)

# Plot time consumption image
plot_time_consumption(log_time, config)

# Output image
imwrite(config['output_path'] + config['output_name'], output)

# Make paste image
reload = load_file_order(config)

# Standard resize
img_ref = Image.open(config['output_path'] + config['output_name'])
h, w = img_ref.size

img_pil = Image.fromarray(img)
img_resized = img_pil.resize((h, w))
# img_resized = img.resize((h, w))
img_resized.save(config['output_path'] + config['output_std_resize'])


if __name__ == '__main__':
    pass
