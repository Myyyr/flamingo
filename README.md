### Build

To build the image use this command :
~~~~
cd path/to/flamingo
docker build -t flamingo:1.0.0 . -f Dockerfile
~~~~


### Run

The command line to run the image with gpus support is :
~~~~
docker run --gpus all --rm -ti --init --ipc=host --volume="$PWD:/app" -e NVIDIA_VISIBLE_DEVICES=0 -w /app flamingo
~~~~

### flamingo

If you want to create an bash alias to run a container using the command `flamingo` you have to :

1. Copy/past the code bellow at the end of your `~/.bashrc`
~~~~
function flamingo(){
  while [[ "$1" =~ ^- && ! "$1" == "--" ]]; do case $1 in
  -u | --user )
    docker run --gpus all --rm -ti --init --ipc=host --volume="$PWD:/app" -e NVIDIA_VISIBLE_DEVICES=0 -u $(id -u):$(id -g) -w /app flamingo:1.0.0
    return
    ;;
  esac; shift; done
  docker run --gpus all --rm -ti --init --ipc=host --volume="$PWD:/app" -e NVIDIA_VISIBLE_DEVICES=0 -w /app flamingo:1.0.0
}
~~~~

2. Run `source ~/.bashrc`

Its done.

The default container run as root, you can use `flamingo -u` to not do it.


### Requirements
You can add/remove python packages in the `requirements.txt` file and re-build the image 

or 

add in the `Dockerfile` using `RUN pip install you_package` bellow the `# Add your packages here` section, then re-rebuild for faster build.