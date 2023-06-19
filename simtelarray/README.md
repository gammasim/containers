# Container for Simulation Software

## Introduction

Provide a container including the following simulation software packages:

- corsika and sim\_telarray

There are two options on how to use this container:

1. Download from [gammasim-tools container repository](https://github.com/gammasim/containers/pkgs/container/gammasim-tools-simtelarray)
2. Build a new container from the available Dockerfile (requires access to sim\_telarray package)

Building:
```
docker build -t sim_telarray .
```

Running:
```
docker run --rm -it -v "$(pwd)/external:/external" simtelarray bash
```

## Run a container using the prepared Docker image available from repository

Packages are available from the [gammasim-tools container repository](//github.com/gammasim/containers/pkgs/container/gammasim-tools-simtel).

To download and run a prepared container in bash:

```
$ docker run --rm -it -v "$(pwd)/external:/workdir/external" ghcr.io/gammasim/gammasim-tools-simtelarray:latest bash
```
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
cd containers/simtelarray/external
git clone git@github.com:gammasim/gammasim-tools.git
cd gammasim-tools
```
Go to the following path (gammasim/containers/simtelarray/) and assure that there is a *Dockerfile* there:
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

- In the same folder (gammasim/containers/simtelarray/), build the docker:
```
docker build -t simtelarray .
```

- Once it is ready (it might take some minutes) run the docker in the same folder (gammasim/containers/simtelarray/):
```
docker run --rm -it -v "$(pwd)/external:/workdir/external" simtelarray bash
```
Now you are inside the container.

__Apple silicon users, notice you should add --platform=linux/amd64 to the run command above.__

Any output will be written to the `$(pwd)/external` directory.
