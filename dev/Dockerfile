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
    unzip && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# corsika and sim_telarray
RUN mkdir sim_telarray
COPY corsika7.7_simtelarray.tar.gz sim_telarray
RUN cd sim_telarray && \
    tar -xvf corsika7.7_simtelarray.tar.gz && \
    ./build_all prod5 qgs2 gsl && \
    find . -name "*.tar.gz" -exec rm -f {} \; && \
    cd ..

From ubuntu:22.10
WORKDIR /workdir
ENV DEBIAN_FRONTEND=noninteractive
COPY --from=build_image /workdir/sim_telarray/ /workdir/sim_telarray/

RUN apt-get update && apt-get install -y \
    bc \
    bzip2 \
    gfortran \
    git \
    libgsl-dev \
    python3-pip \
    unzip \
    zstd \
    wget && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN wget --quiet https://bootstrap.pypa.io/get-pip.py && \
    python3 get-pip.py && \
    ln -s /usr/bin/python3 /usr/bin/python && \
    rm -f get-pip.py

RUN wget --quiet https://raw.githubusercontent.com/gammasim/simtools/main/pyproject.toml && \
    pip install toml-to-requirements && \
    toml-to-req --toml-file pyproject.toml --include-optional

RUN cd /workdir/ && \
    pip install -r requirements.txt

ENV SIMTEL_PATH="/workdir/sim_telarray/"
SHELL ["/bin/bash", "-c"]

WORKDIR /workdir/external
