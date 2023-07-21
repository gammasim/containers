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
    krb5-user \
    libpam-krb5 \
    make \
    unzip \
    vim \
    wget && \
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
    bzip2 \
    gfortran \
    libgsl-dev \
    bc \
    unzip \
    wget \
    python3-pip && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN wget --quiet https://bootstrap.pypa.io/get-pip.py && \
    python3 get-pip.py && \
    ln -s /usr/bin/python3 /usr/bin/python && \
    rm -f get-pip.py

RUN wget --quiet https://github.com/gammasim/simtools/archive/refs/heads/main.zip && \
    unzip main.zip && rm -f main.zip && \
    mv simtools-main simtools

ENV SIMTEL_PATH="/workdir/sim_telarray/"
SHELL ["/bin/bash", "-c"]

RUN cd /workdir/simtools && \
    pip install --no-cache-dir .

WORKDIR /workdir/
