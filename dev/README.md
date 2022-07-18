# Docker container for gammasim-tools development

## Introduction

Provide a container for testing and development of gammasim-tools. This container is not optimised for size, but for completeness of development tools.

Container contains installation of:

- corsika and sim\_telarray
- miniconda
- latex
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

Some of the gammasim-tools examples require data provided by instrument teams as input or comparision parameters.
They are at this point on the CTAO gitlab, and can be cloned using:

```
cd external
./clone_gitlab_verification_data.sh
```

## Running a container using the prepared Docker image

To download and run a prepared container in bash

```
$ docker run --rm -it -v "$(pwd)/external:/workdir/external" ghcr.io/gammasim/containers/gammasim-tools-dev:v0.2.0-dev1 bash
```

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

Building will take a while and the image is large (3.9 GB; mostly due to the >2 GB conda stuff and the large latex installation).

## Running

To run the container in bash 

```
$ docker run --rm -it -v "$(pwd)/external:/workdir/external" gammasim-tools-dev bash
```

Any output will be written to the `$(pwd)/external` directory.

## Docker Hub

An example image is available from [Docker hub](https://hub.docker.com/repository/docker/gernotmaier/gammasim-tools-dev).
