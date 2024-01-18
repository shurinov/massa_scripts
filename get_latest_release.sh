#!/bin/bash

RED="\033[0;31m"
GREEN="\033[0;32m"
YELLOW="\033[33m"
PURPLE='\033[0;35m'
ST="\033[0m"

massa_version=`wget -qO- https://api.github.com/repos/massalabs/massa/releases/latest | jq -r ".tag_name"`; \
wget -qO $HOME/massa.tar.gz "https://github.com/massalabs/massa/releases/download/${massa_version}/massa_${massa_version}_release_linux.tar.gz"; \
tar -xvf $HOME/massa.tar.gz -C $HOME/massa; \
echo -e "${PURPLE}Load massa binary to $HOME/massa \nver:${GREEN}"
$HOME/massa/massa-client/massa-client --version; \
$HOME/massa/massa-node/massa-node --version; \
echo -e "${ST}";

