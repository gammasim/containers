# Docker container for gamma-sim-tools development

## Introduction

Container with:

- corsika and sim_telarray installed
- miniconda installed
- gamma-sim-tools conda packages (from environment.yml) installed

## Building

Building expects that a tar ball of corsika/sim_telarray (corsika7.7_simtelarray.tar.gz ) is available in the building directory.
Download this one from the MPIK website.

```
$ docker build -t gammasim-tools-dev .
```

## Running

To run the container in bash 

```
$ docker run --rm -it -v "$(pwd)/gammasim-tools:/gammasim-tools" gammasim-tools-dev bash
```

In the container, activate the environment:
```
$ conda activate gammasim-tools-dev
```

