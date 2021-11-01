From ubuntu:latest

# Directory in which software is installed
WORKDIR workdir

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y \
    bash \
    build-essential \
    bzip2 \
    csh \
    dvipng \
    gfortran \
    gcc \ 
    g++ \
    git \
    libgsl-dev \
    krb5-user \
    libpam-krb5 \
    make \
    texlive \
    vim \
    wget && \
    apt-get clean &&     rm -rf /var/lib/apt/lists/*

RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-py38_4.10.3-Linux-x86_64.sh -O ~/miniconda.sh && \
    /bin/bash ~/miniconda.sh -b -p ${WORKDIR}/conda && \
    rm ~/miniconda.sh && \
    ${WORKDIR}/conda/bin/conda clean -tipsy
ENV PATH /${WORKDIR}/conda/bin:$PATH

# corsika and sim_telarray
RUN mkdir sim_telarray
COPY corsika7.7_simtelarray.tar.gz sim_telarray
RUN cd sim_telarray && \
    tar -xvzf corsika7.7_simtelarray.tar.gz && \
    ./build_all prod5 qgs2 gsl && \
    rm -f *.tar.gz && \
    cd ..

RUN wget https://raw.githubusercontent.com/gammasim/gammasim-tools/master/environment.yml && \
    conda env create -f environment.yml && \
    conda clean -p -y

ENV SIMTELPATH="/workdir/sim_telarray/"

# Make sure krb token is delegated
RUN mkdir ~/.ssh && \
    echo "GSSAPIDelegateCredentials yes" > ~/.ssh/config && \
    ssh-keyscan -H warp1.zeuthen.desy.de >> ~/.ssh/known_hosts

ENV KRB5CCNAME="FILE:/tmp/token.krb"

ENV SIMTELPATH="/workdir/sim_telarray/"

SHELL ["/bin/bash", "-c"]

RUN conda init bash && \
    source /root/.bashrc

