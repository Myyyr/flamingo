#!/bin/bash


if [ "$1" = "--load" ]
  then
    docker load < $2
    IM = "$2"
  else
    if [ "$1" = "--pull" ]
      then
        docker pull $2
        IM = "$2"
      else
        if [ "$1" = "--fonly" ]
          then
            IM = "$2"
          else
            docker build -t $1 . -f Dockerfile
            IM = "$1"
        fi
    fi
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
      docker run --rm -ti --init --runtime=nvidia --ipc=host --volume=\"\$PWD:/app\" -e NVIDIA_VISIBLE_DEVICES=all -u 1000:1000 -w /app "$IM" bash
  fi
  if [ \"\$ARG\" = \"-p\" ]
    then
      docker run --rm -ti --runtime=nvidia --init --ipc=host --volume=\"\$PWD:/app\" -e NVIDIA_VISIBLE_DEVICES=all -w /app "$IM" python \"\$2\"
  fi
  if [ \"\$ARG\" = \"-d\" ]
    then
      docker run -d -ti --init --runtime=nvidia --ipc=host --volume=\"\$PWD:/app\" -e NVIDIA_VISIBLE_DEVICES=all -w /app "$IM" python \"\$2\"
  fi
  if [ \"\$ARG\" = \"-r\" ]
    then
      docker run --rm -ti --init --runtime=nvidia --ipc=host --volume=\"\$PWD:/app\" -e NVIDIA_VISIBLE_DEVICES=all -w /app "$IM" bash
  fi
}

" > ~/.flamingo.sh

source ~/.bashrc
