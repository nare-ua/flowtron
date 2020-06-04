### run inference with LJS pretrined model (single speacker)
- inside docker
`python inference.py -c config.json -f /mnt/data/pretrained/flowtron/flowtron_ljs.pt -w /mnt/data/pretrained/waveglow/waveglow_256channels_universal_v5.pt -t "It is well known that deep generative models have a deep latent space!" -i 0`


### finetuning MJ
`bash scripts/mj/train.sh`

### colab daemon mode
`sh docker_run.sh sh run_colab.sh`

### run tensorboard
`tensoborad --logdir ./$outdir/logs`

`docker ps` to check which host map is forwarded to 6006 and use browser to
open tensorboard


