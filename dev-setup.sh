#!/usr/bin/env bash

# Update repository
sudo apt-get update

# Install base tools
sudo apt-get install -y \
    git curl vim htop file zip gzip tar build-essential supervisor tmux software-properties-common apt-transport-https wget \
    python-dev python-setuptools python-distutils-extra python3-pip docker.io mongodb snapd snapd-xdg-open \

pip3 install ansible==2.5.8
pip3 install aws-google-auth
pip3 install --upgrade --user awscli
pip3 install --user git+https://github.com/makethunder/awsudo.git
echo 'export PATH="$(python3 -m site --user-base)/bin:${PATH}"' >> ~/.bashrc

cp .gitconfig ~

# Install visual studio code
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt update
sudo apt install code

# Add current user to docker group
sudo usermod -a -G docker $USER

# Install virtual env
sudo pip install virtualenv

# Install sdk man
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"

# Install nvm and lastest nodejs
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash

# Install java 8
sdk install java 8.0.191-oracle

# Install nodejs
nvm install node

# Install brew and  put it to path
HOMEBREW_FORCE_VENDOR_RUBY=1 sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
echo 'export PATH="$PATH:/home/linuxbrew/.linuxbrew/bin"' >> ~/.bashrc

# Install terraform version manager
brew install tfenv

# Install postman
sudo snap install postman