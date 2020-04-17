#!/bin/bash


if [ "$1" = "--load" ]
  then
    docker load < $2
  else
    docker build -t $1 . -f Dockerfile
fi


echo  "
#!/bin/bash


function flamingo(){

  if [ \$# = 0 ]
    then
      ARG=\"-r\"
    else
      ARG=\"\$1\"
  fi

  if [ \"\$ARG\" = \"-u\" ]
    then
      docker run --rm -ti --init --runtime=nvidia --ipc=host --volume=\"\$PWD:/app\" -e NVIDIA_VISIBLE_DEVICES=all -u 1000:1000 -w /app "$1" bash
  fi
  if [ \"\$ARG\" = \"-p\" ]
    then
      docker run --rm -ti --runtime=nvidia --init --ipc=host --volume=\"\$PWD:/app\" -e NVIDIA_VISIBLE_DEVICES=all -w /app "$1" python \"\$2\"
  fi
  if [ \"\$ARG\" = \"-d\" ]
    then
      docker run -d -ti --init --runtime=nvidia --ipc=host --volume=\"\$PWD:/app\" -e NVIDIA_VISIBLE_DEVICES=all -w /app "$1" python \"\$2\"
  fi
  if [ \"\$ARG\" = \"-r\" ]
    then
      docker run --rm -ti --init --runtime=nvidia --ipc=host --volume=\"\$PWD:/app\" -e NVIDIA_VISIBLE_DEVICES=all -w /app "$1" bash
  fi
}

" > ~/.flamingo.sh

source ~/.bashrc
