#!/bin/bash

sudo apt update &&

sudo apt install git &&

curl -L https://www.opscode.com/chef/install.sh | sudo bash &&

git clone https://github.com/fraxeum/fraxeum-node-v01.git &&

cd blockchain/node-linux &&

sudo sh install_node &&
