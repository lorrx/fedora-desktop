#!/usr/bin/env bash

VENV_HOME="/opt/lorrx"
USER=$(whoami)

source "${VENV_HOME}/.venv/bin/activate"

cd ${VENV_HOME}
ANSIBLE_PULL_CMD=$(which ansible-pull)
sudo ${ANSIBLE_PULL_CMD} -U https://github.com/lorrx/fedora-desktop.git -C main pb-fedora-admin.yml
ansible-pull -U https://github.com/lorrx/fedora-desktop.git -C main pb-fedora-user.yml
