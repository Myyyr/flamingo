To build the image use this command :
~~~~
cd path/to/flamingo
sudo docker build -t flamingo < Dockerfile
~~~~

The command line to run the image with gpus support is :
~~~~
docker run --gpus all --rm -ti --init --ipc=host --volume="$PWD:/app" -e NVIDIA_VISIBLE_DEVICES=0 -w /app flamingo
~~~~

If you want to create an bash alias to run a container using the command `flamingo` you have to :

1. Copy/past the code bellow at the end of your `~/.bashrc`
~~~~
function flamingo(){
  while [[ "$1" =~ ^- && ! "$1" == "--" ]]; do case $1 in
  -u | --user )
    docker run --gpus all --rm -ti --init --ipc=host --volume="$PWD:/app" -e NVIDIA_VISIBLE_DEVICES=0 -u $(id -u):$(id -g) -w /app flamingo
    return    
    ;;
  esac; shift; done
  docker run --gpus all --rm -ti --init --ipc=host --volume="$PWD:/app" -e NVIDIA_VISIBLE_DEVICES=0 -w /app flamingo
}
~~~~

2. Run `source ~/.bashrc`

Its done.

The default container run as root, you can use `flamingo -u` to not do it.
