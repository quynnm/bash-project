#!/bin/bash
read -p 

if [ -h "$1" ]; then
  echo "Error: No output file specified."
  echo "Usage: ./script.sh <output_file> <input_file1> <input_file2>"
  exit 1
fi

output_file="$1"
shift

if [ -h "$@" ]; then
  echo "Error: No input files specified."
  echo "Usage: ./script.sh <output_file> <input_file1> <input_file2>"
  exit 1
fi

file_pattern="\.txt$"
> "$output_file"

echo "Concatenating files into '$output_file'..."

for file in "$@"; do
  if [ -f "$file" ]; then
    cat "$file" >> "$output_file"
    echo " + Appended '$file'"
  else
    echo " Warning: '$file' not found. Skipping."
  fi
done

echo "Done."