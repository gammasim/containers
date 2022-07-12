# Docker container for gammasim-tools development

## Introduction

Provide a container for testing and development of gammasim-tools. This container is not optimised for size, but for completeness of development tools.

Container contains installation of:

- corsika and sim\_telarray
- miniconda
- packages required by gammasim-tools (from environment.yml)

The container does not include gammasim-tools, which should be cloned in the ./external directory (see below).

## Preparation

Gammasim-tools is expected to be cloned in a directory external to the container. To set up gammasim-tools, do:

```
mkdir -p external
cd external
git clone git@github.com:gammasim/gammasim-tools.git
```

Setup the database access:
```
cd external
cp gammsim-tools/dbDetails_template.yml dbDetails.yml
```
and modify the file `dbDetails.yml` to include the access credential.

## Building the Container

Building expects that a tar ball of corsika/sim\_telarray (named corsika7.7\_simtelarray.tar.gz) is available in the building directory.
Download the tar package from the MPIK website (password applies) with

```
$ ../tools/download_simulationsoftware.sh
```

Build the container with:

```
$ docker build -t gammasim-tools-dev .
```

__Apple silicon users, notice you should add --platform=linux/amd64 to the build command above.__

Building will take a while and the image is large (3.1 GB; mostly due to the >2 GB conda stuff).


## Running

To run the container in bash 

```
$ docker run --rm -it -v "$(pwd)/external:/workdir/external" gammasim-tools-dev bash
```

__Apple silicon users, notice you should add --platform=linux/amd64 to the run command above.__

Any output will be written to the `$(pwd)/external` directory.

## Docker Hub

An example image is available from [Docker hub](https://hub.docker.com/repository/docker/gernotmaier/gammasim-tools-dev).
