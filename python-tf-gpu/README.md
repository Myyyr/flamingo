# Build

We take advantage of tensorman package that wraps the docker commands for tensorflow. To use it we need to build the image in the tensorman repository

```
docker build --rm -t tensorman:python-gpu-jupyter .
```

# Configuring tensorman

First of all you need to install tensorman package 
```
sudo apt install tensorman
```
Then, to enable GPU computing inside a docker container you need to install the NVIDIA CUDA support for containers :
```
sudo apt install nvidia-container-runtime
```
To run docker without sudo command :
```
sudo usermod -aG docker $USER
```

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