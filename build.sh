#!/bin/bash


docker build -t $1 . -f Dockerfile

echo  "
#!/bin/bash


function flamingo(){

  if [ $# = 0 ]
    then
      ARG="-r"
    else
      ARG="$1"
  fi

  if [ "$ARG" = "-u" ]
    then
      docker run --rm -ti --init --runtime=nvidia --ipc=host --volume="$PWD:/app" -e NVIDIA_VISIBLE_DEVICES=all -u 1000:1000 -w /app pytorch:flamingo bash
  fi
  if [ "$ARG" = "-p" ]
    then
      docker run --rm -ti --runtime=nvidia --init --ipc=host --volume="$PWD:/app" -e NVIDIA_VISIBLE_DEVICES=all -w /app pytorch:flamingo python "$2"
  fi
  if [ "$ARG" = "-d" ]
    then
      docker run -d   -ti --init --runtime=nvidia --ipc=host --volume="$PWD:/app" -e NVIDIA_VISIBLE_DEVICES=all -w /app pytorch:flamingo bash
  fi
  if [ "$ARG" = "-r" ]
    then
      docker run --rm -ti --init --runtime=nvidia --ipc=host --volume="$PWD:/app" -e NVIDIA_VISIBLE_DEVICES=all -w /app pytorch:flamingo bash
  fi
}

" > ~/.flamingo.sh

source ~/.bashrc
