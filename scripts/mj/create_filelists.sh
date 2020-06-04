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
for k in "audio_text" "mel_text"; do
  for t in "train" "val" "test"; do
    s="$dataroot/filelists/${k}_${t}_filelist.txt"
    t="$dataroot/filelists_flowtron/${k}_${t}_filelist.txt"
    # adding dummy speaker_id
    if [[ -f $s ]]; then
      echo "$s => $t"
      sed 's/$/|0/' $s > $t
    else 
      echo "$s not found"
    fi
  done
done

echo "done"
