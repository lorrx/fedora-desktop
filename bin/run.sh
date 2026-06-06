#!/usr/bin/env bash

VENV_HOME="/opt/lorrx"
USER=$(whoami)

source "${VENV_HOME}/.venv/bin/activate"

cd ${VENV_HOME}
ansible-pull -U https://github.com/lorrx/fedora-desktop.git -C main pb-fedora.yml
