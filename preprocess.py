import argparse
from pathlib import Path

import numpy as np
import matplotlib.pyplot as plt
from monai.transforms import LoadImage


def main(params):
    image, _ = LoadImage()(params.input)
    tensor = np.array([
        image[int(image.shape[0]/2)],
        image[:, int(image.shape[1]/2)],
        image[:, :, int(image.shape[2]/2)],
    ]).flatten().reshape(3 * image.shape[0], image.shape[1]).transpose()
    plt.imshow(tensor)
    plt.tight_layout()
    plt.savefig(params.output)


if __name__ == '__main__':
    parser = argparse.ArgumentParser('Preprocess')
    parser.add_argument('--input', required=True, type=Path)
    parser.add_argument('--output', required=True, type=Path)
    params = parser.parse_args()
    main(params)
