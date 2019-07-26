#!/bin/bash
sudo apt-get upgrade
sudo apt-get update
sudo apt-get install git
sudo apt-get install build-essential autotools-dev autoconf libcurl3 libcurl4-gnutls-dev
clear
git clone https://github.com/wolf9466/cpuminer-multi
cd cpuminer-multi
chmod +x autogen.sh
./autogen.sh
CFLAGS="-march=native" ./configure
sudo make install
make

clear


By : Robson Ferreira ne pai ;) @robsonbrasil221

time 10