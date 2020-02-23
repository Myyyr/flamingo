# Import from pytorch + cuda 10.1 container
FROM pytorch/pytorch:latest

# Install some packages

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y git

RUN pip install --upgrade pip

WORKDIR /app
COPY requirements.txt ./
RUN pip install -r requirements.txt
COPY . .

# Add your packages here

# Set the default command
CMD ["bash"]