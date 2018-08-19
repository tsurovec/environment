#!/bin/bash

# DL vim-pliug
echo "Downloading vim-plug"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# install VIM plugins
echo "Installing VIM plugins"
vim +:PlugInstall +:qa

# entr
[ ! -f entr-4.1.tar.gz ] && wget http://entrproject.org/code/entr-4.1.tar.gz 
tar xf ./entr-4.1.tar.gz
pushd eradman-entr-f4e2cbe57708
./configure && make && sudo make install
popd
