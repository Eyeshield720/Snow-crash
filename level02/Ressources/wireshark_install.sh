#!/bin/bash

sudo add-apt-repository ppa:wireshark-dev/stable
sudo apt update
sudo apt install -y wireshark
echo "\e[32mwireshark installed !\e[0m"
sudo wireshark