# Docker container for gammasim-tools production

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
$  docker run --rm -it -v "$(pwd)/external:/workdir/external" -v "/tmp/token.krb:/tmp/token.krb" gammasim-tools-prod bash
```

Notice that we assume a kerberos token file "token.krb" is present in /tmp. This allows smooth connection to the DB. The docker does not fail if the token does not exist (this is a temporary solution.)

In the container, activate the environment for gammasim-tools:
```
$ cd /workdir/external/gammasim-tools/
$ conda activate gammasim-tools-dev
$ source set_simtools.sh
```

Expect any external software (e.g., gammasim-tools) in ./external directory (see [README.md](external/README.md))

