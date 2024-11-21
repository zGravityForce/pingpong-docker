#!/bin/bash

# Check if a key is provided as an argument
if [ -z "$1" ]; then
  echo "Usage: $0 --key=<your_key>"
  exit 1
fi

# Extract the key from the argument
KEY=$1

# Download the PINGPONG binary
echo "Downloading PINGPONG binary..."
wget https://pingpong-build.s3.ap-southeast-1.amazonaws.com/linux/latest/PINGPONG

# Make the binary executable
chmod +x PINGPONG

# Run the PINGPONG binary with the provided key
echo "Running PINGPONG with the provided key: $KEY"
./PINGPONG --key=$KEY
