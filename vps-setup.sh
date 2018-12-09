#!/usr/bin/env bash
# Update repository
sudo apt-get update

# Install base tools
sudo apt-get install -y \
    git curl vim htop exfat-utils exfat-fuse \
    python-pip python-dev docker.io

# Add current user to docker group
sudo usermod -a -G docker $USER

# Install virtual env wrapper
sudo pip install virtualenvwrapper
mkdir ~/.virtualenvs
export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper_lazy.sh

# Install sdk man
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"

# Install java 8
sdk install java 8.0.191-oracle

