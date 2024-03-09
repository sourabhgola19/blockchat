# Use the official Ubuntu 20.04 image as the base
FROM --platform=linux/amd64 ubuntu:20.04

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install curl and other dependencies
RUN apt-get update && \
    apt-get install -y curl && \
    rm -rf /var/lib/apt/lists/*

# Install NVM
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

# Load NVM
ENV NVM_DIR=/root/.nvm
ENV NODE_VERSION 16

# Install Node.js and npm
RUN . "$NVM_DIR/nvm.sh" && \
    nvm install $NODE_VERSION && \
    nvm alias default $NODE_VERSION && \
    nvm use default

# Set the default command for the container
CMD ["node", "-v"]
