# Containers for simtools

[![DOI](https://zenodo.org/badge/285225623.svg)](https://zenodo.org/badge/latestdoi/285225623)

Docker files for [simtools](https://github.com/gammasim/simtools) development and applications.

[Docker](https://www.docker.com/community-edition#/download) or any compatible software are required to run these images.

Types of containers available:
- simtools development: [dev](./dev) provides a container with CORSIKA, sim\_telarray, and simtools conda environment installed. Pull latest release with: `docker pull ghcr.io/gammasim/simtools-dev:latest`
- simtools users: [prod](./prod) provides a container with all software installed (CORSIKA, sim\_telarray, simtools conda environment, gammasim_tools). Pull latest release with: `docker pull ghcr.io/gammasim/simtools-prod:latest`
- sim\_telarray: [simtelarray](./simtelarray) provides a container with the CORSIKA and sim\_telarray installed. Pull latest release with: `docker pull ghcr.io/gammasim/simtools-simtelarray:latest`

The CORSIKA / sim\_telarray packages can be downloaded from MPIK (authentication required).
