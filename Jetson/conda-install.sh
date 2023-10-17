#!/bin/bash

wget --quiet -O archiconda.sh https://github.com/Archiconda/build-tools/releases/download/0.2.3/Archiconda3-0.2.3-Linux-aarch64.sh && \
    sh archiconda.sh -b -p $HOME/archiconda3 && \
    rm archiconda.sh

export PATH=$HOME/archiconda3/bin:$PATH
conda config --add channels gaiar && \
conda config --add channels conda-forge && \
conda config --add channels c4aarch64 && \
conda update -n base --all && \
conda install -y python=3.7 libiconv && \
conda install -y conda-build && \
conda install -y anaconda-client

if grep -Fxq "sconda" $HOME/.local_aliases
then
    echo 'sconda' alias is already defined
else
    echo "alias sconda='. ~/archiconda3/etc/profile.d/conda.sh'" >> ~/.local_aliases
    echo Restart terminal to apply changes
fi