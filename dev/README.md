# Container for simtools development

## Introduction

Provide a container for testing and development of simtools. This container is not optimised for size, but for completeness of development tools.

Container includes installation of:

- corsika and sim\_telarray
- miniconda
- packages required by simtools (from environment.yml)

The container does not include simtools, which should be cloned in the ./external directory (see below).

There are two options on how to use this container:

1. Download from [simtools container repository](https://github.com/gammasim/containers/pkgs/container/simtools-dev)
2. Build a new container from the available Dockerfile (requires access to sim\_telarray package)

## Run a container using the prepared Docker image available from repository

Packages are available from the [simtools container repository](https://github.com/gammasim/containers/pkgs/container/simtools-dev)

To download and run a prepared container in bash:

```
docker run --rm -it -v "$(pwd)/external:/workdir/external" ghcr.io/gammasim/simtools-dev:latest bash -c "$(cat ./entrypoint.sh) && bash"
```

```
docker pull ghcr.io/gammasim/simtools-dev:latest
```

This additionally executes the `entrypoint.sh` script (e.g., for pip install or set the database environment).

## Build a new container

Description of build a new container using the [Dockerfile](Dockerfile) available in this directory.

**Preparation:**

Create a folder called gammasim and clone the container project:
```
mkdir gammasim
cd gammasim
git clone git@github.com:gammasim/containers.git
```
- Clone simtools into the external directory (this is where the source files of simtools will be available for development):
```
cd containers/dev/external
git clone git@github.com:gammasim/simtools.git
cd simtools
```
Go to the following path (gammasim/containers/dev/) and assure that there is a *Dockerfile* there:
```
cd ../../
ls
```

Building expects that a tar ball of corsika/sim\_telarray (named corsika7.7\_simtelarray.tar.gz) is available in the building directory.
Download the tar package from the MPIK website (password applies) with
- Now download (or use another version) of the corsika_simtelarray installation to this folder. To download from the website use:

```
$ ../tools/download_simulationsoftware.sh
```

**Building:**

- In the same folder (gammasim/containers/dev/), build the docker:
```
docker build -t simtools-dev .
```

- Once it is ready (it might take some minutes) run the docker in the same folder (gammasim/containers/dev/):
```
docker run --rm -it -v "$(pwd)/external:/workdir/external" simtools-dev bash
```
- Now you are inside the docker. To test the setup, go the simtools folder and run a pytest:
```
cd simtools
pytest --no-cov
```
- If everything works out, all the tests will pass.
- To leave the docker just type: `exit`

Any output will be written to the `$(pwd)/external` directory.
