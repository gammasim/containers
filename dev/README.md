# Container for gammasim-tools development

## Introduction

Provide a container for testing and development of gammasim-tools. This container is not optimised for size, but for completeness of development tools.

Container contains installation of:

- corsika and sim\_telarray
- miniconda
- packages required by gammasim-tools (from environment.yml)

The container does not include gammasim-tools, which should be cloned in the ./external directory (see below).

There are two options on how to use this container:

1. Download from [gammasim-tools container repository](https://github.com/gammasim/containers/pkgs/container/containers%2Fgammasim-tools-dev) (access restricted)
2. Build a new container from the available Dockerfile (requires access to sim\_telarray package)

## Run a container using the prepared Docker image available from repository

Packages are available from the [gammasim-tools container repository](https://github.com/gammasim/containers/pkgs/container/containers%2Fgammasim-tools-dev).

To download and run a prepared container in bash:

```
$ docker run --rm -it -v "$(pwd)/external:/workdir/external" ghcr.io/gammasim/containers/gammasim-tools-dev:v0.3.0-dev1 bash -c "$(cat ./entrypoint.sh) && bash"
```

```
docker pull ghcr.io/gammasim/gammasim-tools-dev:pr-33-dev
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
- Clone gammasim-tools into the external directory (this is where the source files of gammasim-tools will be available for development):
```
cd containers/dev/external
git clone git@github.com:gammasim/gammasim-tools.git
cd gammasim-tools
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
../tools/download_simulationsoftware.sh
```

**Building:**

- In the same folder (gammasim/containers/dev/), build the docker:
```
docker build -t gammasim-tools-dev .
```

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
- To leave the docker just type: `exit`

Any output will be written to the `$(pwd)/external` directory.
