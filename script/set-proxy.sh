#!/bin/bash

# Path to the .env file
ENV_FILE=".env"

# Check if .env file exists
if [ -f "$ENV_FILE" ]; then
  echo "Loading environment variables from $ENV_FILE"
  
  # Export each variable in the .env file
  export $(grep -v '^#' $ENV_FILE | xargs)

  echo "HTTPS_PROXY set to $HTTPS_PROXY"
  echo "HTTP_PROXY set to $HTTP_PROXY"
  echo "NO_PROXY set to $NO_PROXY"
else
  echo "Error: $ENV_FILE file not found!"
  exit 1
fi
