docker run --gpus all --shm-size=1g --ulimit memlock=-1 --ulimit stack=67108864 -d --rm -p 10089:8888 --ipc=host -v $PWD:/workspace/flowtron/ -v /mnt/data:/mnt/data flowtron $@
