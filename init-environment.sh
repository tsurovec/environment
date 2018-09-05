#!/bin/bash

this=$0
resources_dir=$(readlink -f $this | xargs dirname)

# .vimrc
if [ -f ~/.vimrc ]
then
	diff $resources_dir/.vimrc ~/.vimrc &>/dev/null
	diff=$?
	if [ "$diff" -ne 0 ]
	then
			backup=".vimrc.$(date +%s)"
			echo ".vimrc already exists and differs, backing it up to up to $backup"
			mv ~/.vimrc ~/$backup
	fi
fi
cp $resources_dir/.vimrc ~/.vimrc

# DL vim-pliug
echo "Downloading vim-plug"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# install VIM plugins
echo "Installing VIM plugins"
vim +:PlugInstall +:qa

# entr
pushd /tmp
[ ! -f entr-4.1.tar.gz ] && wget http://entrproject.org/code/entr-4.1.tar.gz 
tar xf ./entr-4.1.tar.gz
pushd eradman-entr-f4e2cbe57708
./configure && make && sudo make install
popd
popd
