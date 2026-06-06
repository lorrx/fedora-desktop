#!/usr/bin/env bash

VENV_HOME="/opt/lorrx"
USER=$(whoami)

source "${VENV_HOME}/.venv/bin/activate"

ANSIBLE_PULL_BIN=$(which ansible-pull)
cd ${VENV_HOME}
sudo ${ANSIBLE_PULL_BIN} -U https://github.com/lorrx/fedora-desktop.git -C main pb-fedora.yml
