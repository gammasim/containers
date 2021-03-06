From sl:7

# Directory in which software is installed
WORKDIR workdir

# basic packages
RUN yum -y install \
  bash \
  csh \
  vim \
  wget \
  krb5-workstation \
  texlive \
  texlive-latex \
  dvipng

# developer tools (g++/gcc/gfortran/...)
RUN yum group install -y "Development Tools" && \
    yum clean all

# gsl
RUN wget "ftp://ftp.gnu.org/gnu/gsl/gsl-2.6.tar.gz" && \
    tar -xvzf gsl-2.6.tar.gz && cd gsl-2.6 && \
    ./configure && make && make install && \
    cd .. && \
    rm -f gsl-2.6.tar.gz && \
    rm -rf gsl-2.6
# add gsl to LD_LIBRARY_PATH
ENV LD_LIBRARY_PATH "/usr/local/lib:${LD_LIBRARY_PATH}"

# install miniconda
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
RUN bash Miniconda3-latest-Linux-x86_64.sh -b && \
    rm -f Miniconda3-latest-Linux-x86_64.sh
ENV PATH /root/miniconda3/bin:$PATH

# install environment for gammasim-tools

# corsika and sim_telarray
RUN mkdir sim_telarray
COPY corsika7.7_simtelarray.tar.gz sim_telarray
RUN cd sim_telarray && \
    tar -xvzf corsika7.7_simtelarray.tar.gz && \
    ./build_all prod5 qgs2 gsl && \
    rm -f *.tar.gz && \
    cd ..

RUN  wget https://raw.githubusercontent.com/gammasim/gammasim-tools/master/environment.yml && \
    conda env create -f environment.yml && \
    conda clean -p -y

# Make sure krb token is delegated
RUN mkdir ~/.ssh && \
    echo "GSSAPIDelegateCredentials yes" > ~/.ssh/config && \
    ssh-keyscan -H warp1.zeuthen.desy.de >> ~/.ssh/known_hosts
    
ENV KRB5CCNAME="FILE:/tmp/token.krb"

ENV SIMTELPATH="/workdir/sim_telarray/"

RUN conda init bash && \
    source /root/.bashrc
