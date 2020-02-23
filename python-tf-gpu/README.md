# Build

We take advantage of tensorman package that wraps the docker commands for tensorflow. To use it we need to build the image in the tensorman repository

```
docker build --rm -t tensorman:python-gpu-jupyter .
```

# Configuring tensorman

To purify the tensorman command to run python code, I would recommend to copy the config.toml file to your ~/.config/tensorman

# Classic commands

To run a jupyter notebook with GPU enabled 

```
tensorman run --gpu bash
jupyter notebook --ip=0.0.0.0
```

To run code 
```
tensorman run --gpu python3 file.py
```