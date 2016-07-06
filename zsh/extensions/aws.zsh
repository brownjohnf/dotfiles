function aws () {
  vol=${2:-/tmp}

  docker run -it --rm \
    -v /mnt/pw/aws:/root/.aws \
    -v $vol:/mnt \
    -e AWS_DEFAULT_PROFILE=$1 \
    -e PS1="$1 AWS # " \
    --entrypoint /bin/bash \
    cgswong/aws:latest
}

