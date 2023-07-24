# Container for simtools production

## Introduction

Provide a container for using simtools.

Container includes installation of:

- corsika and sim\_telarray
- miniconda
- packages required by simtools (from environment.yml)
- simtools (main branch)

Images are automatically built by the [Github action workflow ../.github/workflows/build-image.yml](../.github/workflows/build-image.yml) and can be downloaded from the [gammasim package website](https://github.com/gammasim/containers/pkgs/container/simtools-prod).

## Running

To run the container in bash 
```
docker run ghcr.io/gammasim/simtools-prod:latest bash
```
In the container, simtools applications are installed and can be called directly (e.g., `simtools-prod simtools-print-array-elements -h`).

In case file exchange with the local file system is required, use the docker syntax to mount a directory. Example:
```
docker run --rm -it -v "$(pwd):/workdir/external" ghcr.io/gammasim/simtools-prod:latest bash
```

The following examples runs an application inside the container and write the output into a directory of the local files system, 
```
docker run --rm -it -v "$(pwd):/workdir/external" \
    ghcr.io/gammasim/simtools-prod:latest \
    simtools-print-array-elements \
    --array_element_list ./simtools/tests/resources/telescope_positions-North-utm.ecsv \
    --export corsika --use_corsika_telescope_height \
    --output_path /workdir/external/
```

Output files can be found `./simtools-output/`.

## Building (for developers)

Building expects that a tar ball of corsika/sim\_telarray (corsika7.7\_simtelarray.tar.gz) is available in the building directory.
Download the tar package from the MPIK website (password applies) with

```
$ ../tools/download_simulationsoftware.sh
```

**Building:**

```
$ docker build -t simtools-prod .
```

Building will take a while and the image is large (~1.4 GB).
