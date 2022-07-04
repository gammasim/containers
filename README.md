# Introduction

Docker files for [gammasim-tools](https://github.com/gammasim/gammasim-tools) applications.

# Docker Containers

You must [have Docker installed](https://www.docker.com/community-edition#/download) to run these images.

The following Docker files are available:

- Running gammasim applications (./docker-gammasim-application)

## Installation

see [./dev](./dev) or [./prod](./prod) directories for docker images used for 
gammasim-tools development or production. Main difference is:
- [prod](prod/README.md): includes gammasim-tools and corsika/sim_telarray installation (**experimental - not working yet**)
- [dev](dev/README.md): includes corsika/sim_telarray, a full latex installation and expects the gammasim-tools installation in the `./external` directory

