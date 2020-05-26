### run inference with LJS pretrined model (single speacker)
`python inference.py -c config.json -f /mnt/data/pretrained/flowtron/flowtron_ljs.pt -w /mnt/data/pretrained/waveglow/waveglow_256channels_universal_v5.pt -t "It is well known that deep generative models have a deep latent space!" -i 0`

### colab daemon mode
`sh docker_run.sh sh run_colab.sh`

jupyter server will be available at localhost:10089
