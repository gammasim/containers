# Container for simtools production

## Introduction

Provide a container for using simtools.

Container includes installation of:

- corsika and sim\_telarray
- miniconda
- packages required by simtools (from environment.yml)
- simtools (master)

Images are automatically built by the [Github action workflow ../.github/workflows/build-image.yml](../.github/workflows/build-image.yml) and can be downloaded from the [gammasim package website](https://github.com/orgs/gammasim/packages).

## Running

To run the container in bash 

```
docker run --rm -it -v "$(pwd)/external:/workdir/external" ghcr.io/gammasim/simtools-prod:latest bash
```

In the container, find the simtools directory in `/workdir/simtools/`.

To run an application inside the container, e.g.:
```
docker run --rm -it -v "$(pwd)/external:/workdir/external" \
    ghcr.io/gammasim/simtools-prod:latest \
    python /workdir/simtools/applications/print_array_elements.py
```

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

Building will take a while and the image is large (~1.3 GB).

**Running**

To run the container that was just built,

```
docker run --rm -it simtools-prod bash
```

Notice that in this case we did not include the `external` directory since we did not set it up before. It can be done similarly to the `dev` container if needed though.

