# Start from an Ubuntu base image
FROM ubuntu:20.04

# Set the maintainer of the Dockerfile
LABEL maintainer="dxie@tenstorrent.com"

# Avoid timezone interactive dialog
ENV DEBIAN_FRONTEND=noninteractive

# Install required packages
RUN echo "Installing required packages..." && \
    apt-get update && apt-get install -y \
    curl \
    git \
    vim \
    wget \
    bzip2 \
    ca-certificates \
    sudo \
    locales \
    fontconfig \
    bash \
    build-essential \
    cpio

# Configure environment
ENV CONDA_DIR=/opt/conda \
    PATH=/opt/conda/bin:$PATH

# Install Conda
RUN echo "Installing Conda..." && \
    wget https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Linux-x86_64.sh -O ~/miniconda.sh && \
    /bin/bash ~/miniconda.sh -b -p $CONDA_DIR

# Clean Conda installation
RUN echo "Cleaning up Conda..." && \
    rm ~/miniconda.sh && \
    conda clean --all -y

# If you need to update Conda in the future, you can uncomment the following line:
RUN conda update -n base conda -y

RUN echo "Installing and activating conda-lock..." && \
    conda install -n base conda-lock -y && \
    conda init bash && \
    echo "source /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc && \
    echo "conda activate base" >> ~/.bashrc

# Clone Chipyard repository
RUN echo "Cloning Chipyard repository..." && \
    git clone https://github.com/ucb-bar/chipyard.git && \
    cd chipyard && \
    git checkout 1.9.1

# Install Chipyard and its dependencies
RUN echo "Installing Chipyard and its dependencies..." && \
    cd chipyard && \
    ./build-setup.sh riscv-tools -s 8 -s 9

