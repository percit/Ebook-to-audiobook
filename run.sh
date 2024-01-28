#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Usage: $0 <input_ebook_file> <model_name>"
    exit 1
fi

input_ebook="$1"
model_name="$2"

ebook-convert "$input_ebook" output.txt

filename_no_ext=$(basename "$input_ebook" | sed 's/\.[^.]*$//')

cat output.txt | piper \
  --model "$model_name" \
  --output_file "$filename_no_ext".wav

rm output.txt


