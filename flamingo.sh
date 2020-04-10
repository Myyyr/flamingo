#!/bin/bash

echo "
# Import from pytorch + cuda 10.1 container
FROM pytorch/pytorch:latest

" >  Dockerfile

echo "# Install some packages

RUN apt-get update && \\ 
    apt-get upgrade -y && \\
    apt-get install -y git

RUN pip install --upgrade pip

WORKDIR /app

" >> Dockerfile

echo "
RUN pip install matplotlib numpy pandas scipy

# Efficient jobs (caching, parallelism, persistence)
RUN pip install joblib

# Easy http requests
RUN pip install requests

##### Machine Learning packages
RUN pip install scikit-learn

##### Image manipulation
RUN pip install imageio Pillow scikit-image graphviz pydot opencv-python pyglet 

# May be useful with Pandas for complex "where" clauses (e.g., Pandas
# tutorial).
RUN pip install numexpr

# Optional: tqdm displays nice progress bars, ipywidgets for tqdm's notebook support
RUN pip install tqdm ipywidgets


# RevNets requirements
RUN pip install h5py
RUN pip install -e git+https://github.com/lmkoch/medpy/#egg=medpy
RUN pip install revtorch scikit-image nibabel comet-ml


# Add your packages here

" >> Dockerfile

docker build -t flamingo:1.0.1 . -f Dockerfile

echo  "
function flamingo(){
  while [[ '\$1' =~ ^- && ! '\$1' == '--' ]]; do case \$1 in
	-u | --user )
	docker run --gpus all --rm -ti --init --ipc=host --volume='\$PWD:/app' -e NVIDIA_VISIBLE_DEVICES=0 -u \$(id -u):\$(id -g) -w /app flamingo:1.0.1 bash
	return
	;;
	-p | --python )
	docker run --gpus all --rm -ti --init --ipc=host --volume='\$PWD:/app' -e NVIDIA_VISIBLE_DEVICES=0 -w /app flamingo:1.0.1 python
	return
	;;
  esac; shift; done
  docker run --gpus all --rm -ti --init --ipc=host --volume='\$PWD:/app' -e NVIDIA_VISIBLE_DEVICES=0 -w /app flamingo:1.0.1 bash
}
" >> ~/.bashrc

source ~/.bashrc


# function flamingo(){
#   while [[ "$1" =~ ^- && ! "$1" == "--" ]]; do case $1 in
#   -u | --user )
#     docker run --gpus all --rm -ti --init --ipc=host --volume="$PWD:/app" -e NVIDIA_VISIBLE_DEVICES=0 -u $(id -u):$(id -g) -w /app flamingo:1.0.0
#     return
#     ;;
#   esac; shift; done
#   docker run --gpus all --rm -ti --init --ipc=host --volume="$PWD:/app" -e NVIDIA_VISIBLE_DEVICES=0 -w /app flamingo:1.0.0
# }


