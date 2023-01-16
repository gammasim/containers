From ubuntu:22.10 as build_image
WORKDIR /workdir
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    bash \
    build-essential \
    bzip2 \
    csh \
    git \
    libgsl-dev \
    unzip \
    vim \
    wget && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN uname -a

RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-$(uname -p).sh -O ~/miniconda.sh && \
    /bin/bash ~/miniconda.sh -b -p /workdir/conda && \
    rm ~/miniconda.sh && \
    /workdir/conda/bin/conda clean -tipy && \
    /workdir/conda/bin/conda install -c conda-forge mamba

WORKDIR /workdir/external
