# Docker container for gammasim-tools development

## Introduction

Provide a container for testing and development of gammasim-tools. This container is not optimised for size, but for completeness of development tools.

Container contains installation of:

- corsika and sim\_telarray
- miniconda
- packages required by gammasim-tools (from environment.yml)

The container does not include gammasim-tools, which should be cloned in the ./external directory (see below).

## Running a container using the prepared Docker image

- To download and run a prepared container in bash:

```
$ docker run --rm -it -v "$(pwd)/external:/workdir/external" ghcr.io/gammasim/containers/gammasim-tools-dev:v0.2.0-dev1 bash
```
- If you don't have a prepared container, follow the instructions below.

## First step: Preparation
- Create a folder called gammasim:
```
mkdir gammasim
```
- Go to the folder and clone the container project
```
cd gammasim
git clone git@github.com:gammasim/containers.git
```
- Go to the following path and clone gammasim-tools there:
```
cd containers/dev/external
git clone git@github.com:gammasim/gammasim-tools.git
cd gammasim-tools
```
- Set up the db authentication file with the appropriated information in the gammasim-tools folder. The file should be named *dbDetails.yml* and should contain details on the connection to the DB. A template is available in the *dbDetails_template.yml* file. Ask for details of the connection to the responsible person.

## Second step: Build the Docker
- Go to the following path (gammasim/containers/dev/) and assure that there is a *Dockerfile* there:
```
cd ../../
ls
```

## Building the Container

Building expects that a tar ball of corsika/sim\_telarray (named corsika7.7\_simtelarray.tar.gz) is available in the building directory.
Download the tar package from the MPIK website (password applies) with
- Now download (or use another version) of the corsika_simtelarray installation to this folder. To download from the website use:

```
../tools/download_simulationsoftware.sh
```
- In the same folder (gammasim/containers/dev/), build the docker:
```
docker build -t gammasim-tools-dev .
```
## Third step: Run the docker
- Once it is ready (it might take some minutes) run the docker in the same folder (gammasim/containers/dev/):
```
docker run --rm -it -v "$(pwd)/external:/workdir/external" gammasim-tools-dev bash
```
- Now you are inside the docker. To test the setup, go the gammasim-tools folder and run a pytest:
```
cd gammasim-tools
pytest --no-cov
```
- If everything works out, all the tests will pass.
- To leave the docker just type:
```
exit
```

__Apple silicon users, notice you should add --platform=linux/amd64 to the run command above.__

Any output will be written to the `$(pwd)/external` directory.

## Docker Hub

An example image is available from [Docker hub](https://hub.docker.com/repository/docker/gernotmaier/gammasim-tools-dev).
