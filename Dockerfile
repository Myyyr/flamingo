# Import from pytorch + cuda 10.1 container
FROM pytorch/pytorch:latest

# Change user to root

# Install some packages

RUN apt update && \
    apt upgrade -y && \
    apt install -y git

RUN pip install --upgrade pip
RUN pip install matplotlib numpy pandas scipy joblib requests scikit-learn imageio Pillow scikit-image graphviz pydot opencv-python pyglet numexpr tqdm ipywidgets h5py -e git+https://github.com/lmkoch/medpy/#egg=medpy revtorch scikit-image nibabel comet-ml


# Set the default command
CMD ["bash"]