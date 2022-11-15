# Containers for gammasim-tools

[![DOI](https://zenodo.org/badge/285225623.svg)](https://zenodo.org/badge/latestdoi/285225623)

Docker files for [gammasim-tools](https://github.com/gammasim/gammasim-tools) development and applications.

[Docker](https://www.docker.com/community-edition#/download) or any compatible software are required to run these images.

Types of containers available:
- gammasim-tools development: [dev](./dev) provides a container with CORSIKA, sim\_telarray, and gammasim-tools conda environment installed
- gammasim-tools users: [prod](./prod) provides a container with all software installed (CORSIKA, sim\_telarray, gammasim-tools conda environment, gammasim_tools)
- sim\_telarray: [simtelarray](./simtelarray) provides a container with the CORSIKA and sim\_telarray installed.

The CORSIKA / sim\_telarray packages can be downloaded from MPIK (authentication required).
