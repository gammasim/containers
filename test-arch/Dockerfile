From ubuntu:22.10 as build_image
WORKDIR /workdir
ENV DEBIAN_FRONTEND=noninteractive

RUN uname -a

RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-$(uname -p).sh -O ~/miniconda.sh && \
    /bin/bash ~/miniconda.sh -b -p /workdir/conda && \
    rm ~/miniconda.sh && \
    /workdir/conda/bin/conda clean -tipy && \
    /workdir/conda/bin/conda install -c conda-forge mamba

WORKDIR /workdir/external
