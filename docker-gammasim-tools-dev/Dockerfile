From ubuntu:latest
WORKDIR workdir
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
ENV SIMTELPATH="/workdir/sim_telarray/"

RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-py38_4.10.3-Linux-x86_64.sh -O ~/miniconda.sh && \
    /bin/bash ~/miniconda.sh -b -p ${WORKDIR}/conda && \
    rm ~/miniconda.sh && \
    ${WORKDIR}/conda/bin/conda clean -tipsy && \
    ${WORKDIR}/conda/bin/conda install -c conda-forge mamba
ENV PATH /${WORKDIR}/conda/bin:$PATH

# tex installation
RUN apt-get update && apt-get install -y \
    cm-super \
    dvipng \
    texlive-latex-extra \
    texlive-fonts-recommended && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN wget https://raw.githubusercontent.com/gammasim/gammasim-tools/master/environment.yml && \
    mamba env update --file  environment.yml && \
    conda clean -tipsy

# Make sure krb token is delegated
RUN mkdir ~/.ssh && \
    echo "GSSAPIDelegateCredentials yes" > ~/.ssh/config && \
    ssh-keyscan -H warp1.zeuthen.desy.de >> ~/.ssh/known_hosts

ENV KRB5CCNAME="FILE:/tmp/token.krb"
SHELL ["/bin/bash", "-c"]

RUN source /root/.bashrc && \
    conda init bash
RUN echo "conda activate gammasim-tools-dev" >> ~/.bashrc
ENV PYTHONPATH=$PYTHONPATH:"/workdir/external/gammasim-tools"

COPY config.yml /workdir/gammasim-tools
