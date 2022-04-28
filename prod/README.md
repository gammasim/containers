# Docker container for gammasim-tools production

**this is work in progress and not working yet**

## Introduction

Provide a container for using gammasim-tools.

Container contains installation of:

- corsika and sim\_telarray
- miniconda
- packages required by gammasim-tools (from environment.yml)
- gammasim-tools (master)

## Building

Building expects that a tar ball of corsika/sim\_telarray (corsika7.7\_simtelarray.tar.gz) is available in the building directory.
Download the tar package from the MPIK website (password applies) with

```
$ ../tools/download_simulationsoftware.sh
```

Build the container with:

```
$ docker build -t gammasim-tools-prod .
```

Building will take a while and the image is large (3.9 GB; mostly due to the >2 GB conda stuff).

## Running

To run the container in bash 

```
$  docker run --rm -it -v "$(pwd)/external:/workdir/external" gammasim-tools-prod bash
```

In the container, find the gammasim-tools directory:
```
$ cd ./gammasim-tools/
```

Expect any external software (e.g., gammasim-tools) in ./external directory (see [README.md](external/README.md))

