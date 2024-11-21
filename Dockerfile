# Base image: Ubuntu 22.04
FROM ubuntu:22.04

# Set environment variable to avoid interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Install necessary tools, including Docker
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    apt-transport-https \
    curl \
    wget \
    vim \
    ca-certificates \
    gnupg \
    software-properties-common && \
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - && \
    add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" && \
    apt-get update && apt-get install -y docker-ce docker-ce-cli containerd.io && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set the working directory in the container
WORKDIR /app

# Copy the `script` folder from the host to the container
COPY script /app/script

# Make all scripts in the `script` folder executable
RUN chmod -R +x /app/script

# Default command: Enter a bash shell
CMD ["bash"]
