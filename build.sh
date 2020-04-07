#!/bin/bash


docker build -t $1 . -f Dockerfile

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
      docker run --gpus all --rm -ti --init --ipc=host --volume=\"\$PWD:/app\" -e NVIDIA_VISIBLE_DEVICES=0 -u 1000:1000 -w /app $1 bash
  fi
  if [ \"\$ARG\" = \"-p\" ]
    then
      docker run --gpus all --rm -ti --init --ipc=host --volume=\"\$PWD:/app\" -e NVIDIA_VISIBLE_DEVICES=0 -w /app $1 python \"\$2\"
  fi
  if [ \"\$ARG\" = \"-r\" ]
    then
      docker run --gpus all --rm -ti --init --ipc=host --volume=\"\$PWD:/app\" -e NVIDIA_VISIBLE_DEVICES=0 -w /app $1 bash
  fi
}

" > ~/.flamingo.sh

source ~/.bashrc
