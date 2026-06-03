#!/usr/bin/env bash

VENV_HOME="/opt/lorrx"
USER=$(whoami)

# Install requirements for Ansible
sudo dnf update -y
sudo dnf install -y python3-virtualenv python3-pip git

# Create workdir and set permissions
sudo mkdir -p ${VENV_HOME}
sudo chown ${USER} ${VENV_HOME} -R
sudo chmod 755 ${VENV_HOME}

# Create and activate Python env
python3 -m venv ${VENV_HOME}/.venv
source "${VENV_HOME}/.venv/bin/activate"
pip install --upgrade pip
pip install --upgrade ansible

# Run Ansible playbook in pull mode
ANSIBLE_PULL_BIN=$(which ansible-pull)
cd ${VENV_HOME}
sudo ${ANSIBLE_PULL_BIN} -U https://github.com/lorrx/fedora-desktop.git -C main pb-fedora.yml
