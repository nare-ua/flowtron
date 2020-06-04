for d in angry  calm  disgust  fearful  happy  neutral  sad  surprised; do
  cd $d
  for fn in *.wav; do
    echo "processing $d/$fn"
    sox $fn -b 16 ${fn%.*}_.wav rate -I 22050 dither -s
  done
  cd ..
done
