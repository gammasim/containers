# Introduction

Experimental Docker files (and later singularity configurations) are provided for gammasim applications.

# Docker Containers

You must [have Docker installed](https://www.docker.com/community-edition#/download) to run these images.

The following Docker files are available:

- Running gammasim applications (./docker-gammasim-application)

# Building corsika/sim_telarray

```
build_all prod5 qgs2 gsl
```

or use the following Makefile options:

```
EXTRA_DEFINES="-DCTA_PROD4 -DMAXIMUM_TELESCOPES=180 -DWITH_GSL_RNG"
```
