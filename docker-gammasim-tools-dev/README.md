# Docker container for gamma-sim-tools development

## Introduction

Container with:

- corsika and sim_telarray installed
- miniconda installed
- gamma-sim-tools conda packages (from environment.yml) installed

## Building

Building expects that a tar ball of corsika/sim_telarray (corsika7.7_simtelarray.tar.gz ) is available in the building directory.
Download this one from the MPIK website with

```
$ ./download_simulationsoftware.sh
```

Build the container with:

```
$ docker build -t gammasim-tools-dev .
```

Building will take a while and the image is large (3.9 GB; mostly due to the >2 GB conda stuff).

## Running

To run the container in bash 

```
$ docker run --rm -it -v "$(pwd)/gammasim-tools:/gammasim-tools" -v "/tmp/token.krb:/tmp/token.krb" gammasim-tools-dev bash
```

Notice that we assume a kerberos token file "token.krb" is present in /tmp. This allows smooth connection to the DB. The docker does not fail if the token does not exist. (This is a temporary solution.)

In the container, activate the environment:
```
$ conda activate gammasim-tools-dev
```

Expect gammasim-tools package in directory /gammasim-tools/

Get package with

```
git clone https://github.com/gammasim/gammasim-tools.git gammasim-tools
```

