#!/bin/bash
# entrypoint script to configure development environment

cd /workdir/external/gammasim-tools
pip install -e .

if [[ -e "set_DB_environ.sh" ]]; then
    source ./set_DB_environ.sh
fi
