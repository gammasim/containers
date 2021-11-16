# Docker container for gammasim-tools development

## Introduction

Provide a container for testing and development of gammasim-tools. This container is not optimised for size, but for completeness of development tools.

Container contains installation of:

- corsika and sim\_telarray
- miniconda
- packages required by gammasim-tools (from environment.yml)

The container does not include gammasim-tools, which should be cloned in the ./external directory (see below).

## Building

Building expects that a tar ball of corsika/sim\_telarray (corsika7.7\_simtelarray.tar.gz) is available in the building directory.
Download the tar package from the MPIK website (password applies) with

```
$ ./download_simulationsoftware.sh
```

Build the container with:

```
$ docker build -t gammasim-tools-dev .
```

Building will take a while and the image is large (3.9 GB; mostly due to the >2 GB conda stuff).

## gammasim-tools 

Clone the gammasim-tools code into the './external/' directory (see also [README.md](external/README.md):

```
cd ./external
git clone https://github.com/gammasim/gammasim-tools.git
cd ..
```

## Running

To run the container in bash 

```
$ docker run --rm -it -v "$(pwd)/external:/workdir/external" -v "/tmp/token.krb:/tmp/token.krb" gammasim-tools-dev bash
```

Notice that we assume a kerberos token file "token.krb" is present in /tmp. This allows smooth connection to the DB. The docker does not fail if the token does not exist (this is a temporary solution.)

In the container, activate the environment for gammasim-tools:
```
$ cd /workdir/external/gammasim-tools/
$ conda activate gammasim-tools-dev
$ source set_simtools.sh
```

Expect any external software (e.g., gammasim-tools) in ./external directory (see [README.md](external/README.md))

## Docker Hub

An example image is available from [Docker hub](https://hub.docker.com/repository/docker/gernotmaier/gammasim-tools-dev).
