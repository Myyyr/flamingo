### Build

To build the image use this command :
~~~~
cd path/to/flamingo
bash ./build.sh name
~~~~
With `name` the name of your image. 

### Run

The command line to run the image with gpus support is :
~~~~
docker run --gpus all --rm -ti --init --ipc=host --volume="$PWD:/app" -e NVIDIA_VISIBLE_DEVICES=0 -w /app image_name
~~~~


### flamingo

If you want to create an bash alias to run a container using the command `flamingo` you have to :

1. Verify fou have the file `~/.flamingo.sh`. If not, go to the Build part.

2. Copy/past the code bellow at the end of your `~/.bashrc`
~~~~
. ~/.flamingo.sh
~~~~

3. Run `source ~/.bashrc`

Its done.

The default container run as root, you can use `flamingo -u` to not do it.
Use `flamingo -p script.py` to run a script.


### Requirements


Add in the `Dockerfile` using `RUN pip install your_package` At the end of the file, then follow instructions of the Build part.