docker run --gpus all --shm-size=1g --ulimit memlock=-1 --ulimit stack=67108864 -it --rm -P --ipc=host -v $PWD:/workspace/flowtron/ -v /mnt/data:/mnt/data flowtron
