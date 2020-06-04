#!/bin/env bash

set -euo pipefail

# convert mp3 to wav files 
dataroot="/mnt/data/datasets/MJ"

if [[ -d $dataroot/filelists_flowtron ]]; then
  echo "please remove '$dataroot/filelists_flowtron' manually"
  exit 1
fi

echo -n "converting tacotron filelists to flowtron..." 
mkdir -p $dataroot/filelists_flowtron
for t in "train" "val"; do
  s="$dataroot/filelists/audio_text_${t}_filelist.txt"
  t="$dataroot/filelists_flowtron/audio_text_${t}_filelist.txt"
  # adding dummy speaker_id
  if [[ -f $s ]]; then
    echo "$s => $t"
    sed 's/$/|0/' $s > $t
  fi
done

# split to val dataset
if [[ ! -f "$dataroot/filelists_flowtron/audio_text_val_filelist.txt" ]]; then
  tail -n 10 "$dataroot/filelists_flowtron/audio_text_train_filelist.txt" > \
    "$dataroot/filelists_flowtron/audio_text_val_filelist.txt"
  tmpfn=/mnt/tmp/$(uuid)
  head -n -10 "$dataroot/filelists_flowtron/audio_text_train_filelist.txt" > \
    $tmpfn
  mv $tmpfn "$dataroot/filelists_flowtron/audio_text_train_filelist.txt"
fi

echo "done"
