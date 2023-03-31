# Segmentation UNSURE

This programs aims to evaluate segmentation using as much as possible linux basic utilities.

## Requirements

- linux (tested on Arch Linux)
- GNU make (tested with version 4.4.1)
- sxiv (tested with version v26-1-g2cac112)
- itksnap (tested with version 3.8.0)
- notify-send (0.8.2)

## How to run

### Configuration

- Change adequately and consistently the variables IN and OUT in both `Makefile` and `key-handler`
- PLACE YOURSELF IN A NEW PYTHON VIRTUALENV, and run:
```bash
make set
```

### Preprocess of the data

Run the preprocessing in parallel (-j4 means 4 jobs in parallel):
```bash
make -j4 preprocess
```

### Run

Run the processing (based on sxiv and itksnap)
```bash
make process
```

### Clean

Clean the directory
```bash
make clean
```

## TIPS

### SXIV shortcut

- most vim shortcuts
- `<cr>` switch between thumbnail and image mode
- `+` zoom in
- `-` zoom out
- `n` next image
- `p` previous image
- `C-x C-j` okay
- `C-x C-k` not okay
- `C-x C-v` vizualize the image in itksnap

### TODO

- make the pre-processing of the ground-truth to reduce there size
- Change itksnap for a python code

## Author

Robin Camarasa
