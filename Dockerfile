
# Import from pytorch + cuda 10.1 container
FROM pytorch/pytorch:latest


# Install some packages

RUN apt-get update && \ 
    apt-get upgrade -y && \
    apt-get install -y git

RUN pip install --upgrade pip

WORKDIR /app



RUN pip install matplotlib numpy pandas scipy

# Efficient jobs (caching, parallelism, persistence)
RUN pip install joblib

# Easy http requests
RUN pip install requests

##### Machine Learning packages
RUN pip install scikit-learn

##### Image manipulation
RUN pip install imageio Pillow scikit-image graphviz pydot opencv-python pyglet 

# May be useful with Pandas for complex where clauses (e.g., Pandas
# tutorial).
RUN pip install numexpr

# Optional: tqdm displays nice progress bars, ipywidgets for tqdm's notebook support
RUN pip install tqdm ipywidgets


# RevNets requirements
RUN pip install h5py
RUN pip install -e git+https://github.com/lmkoch/medpy/#egg=medpy
RUN pip install revtorch scikit-image nibabel comet-ml


# Add your packages here


RUN pip install rasterio pystac shapely geopandas
RUN apt-get install -y libspatialindex-dev
RUN pip install Rtree

# 1.0.4
RUN pip install tensorboard 

# 1.0.5
RUN pip install torchsummary


# 1.0.6
RUN apt-get update && apt-get install -y libsm6 libxext6 libxrender-dev


# 1.0.7
RUN pip install medpy
