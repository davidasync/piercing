#!/usr/bin/env bash

# Update repository
sudo apt-get update

# Install base tools
sudo apt-get install -y \
    git curl vim htop file zip gzip tar build-essential \
    python-pip python-dev python-setuptools \
    docker.io mongodb

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

# Install nvm and lastest nodejs
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash

# Install java 8
sdk install java 8.0.191-oracle

# Install nodejs
nvm install node

# Install brew and put it to path
HOMEBREW_FORCE_VENDOR_RUBY=1 sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
echo 'export PATH="$PATH:/home/linuxbrew/.linuxbrew/bin"' >> ~/.bashrc
