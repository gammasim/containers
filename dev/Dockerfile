From ubuntu:22.10 as build_image
WORKDIR /workdir
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    bash \
    build-essential \
    bzip2 \
    csh \
    gfortran \
    gcc \ 
    g++ \
    git \
    libgsl-dev \
    make \
    unzip \
    vim \
    wget && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# corsika and sim_telarray
RUN mkdir sim_telarray
COPY corsika7.7_simtelarray.tar.gz sim_telarray
RUN cd sim_telarray && \
    tar -xvzf corsika7.7_simtelarray.tar.gz && \
    ./build_all prod5 qgs2 gsl && \
    find . -name "*.tar.gz" -exec rm -f {} \; && \
    cd ..

RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-$(uname -p).sh -O ~/miniconda.sh && \
    /bin/bash ~/miniconda.sh -b -p /workdir/conda && \
    rm ~/miniconda.sh && \
    /workdir/conda/bin/conda clean -tipy && \
    /workdir/conda/bin/conda install -c conda-forge mamba

RUN wget https://raw.githubusercontent.com/gammasim/gammasim-tools/master/environment.yml

From ubuntu:22.10
WORKDIR /workdir
ENV DEBIAN_FRONTEND=noninteractive
COPY --from=build_image /workdir/sim_telarray/ /workdir/sim_telarray/
COPY --from=build_image /workdir/conda /workdir/conda
COPY --from=build_image /workdir/environment.yml /workdir/environment.yml

RUN apt-get update && apt-get install -y \
    bzip2 \
    gfortran \
    libgsl-dev \
    bc \
    unzip && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

ENV PATH /workdir/conda/bin:$PATH

RUN mamba env update -n base --file environment.yml && \
    conda remove --yes mamba && conda clean --all

ENV SIMTEL_PATH="/workdir/sim_telarray/"
SHELL ["/bin/bash", "-c"]

RUN source /root/.bashrc && \
    conda init bash

WORKDIR /workdir/external
