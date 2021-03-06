#!/bin/bash

# Move to directory of script
OLDDIR=`pwd`
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR

# Backup old vimrc files
if [ -f ~/.vimrc ]; then
	mv ~/.vimrc ~/.vimrc.old
fi;
if [ -f ~/.vimrc_plugins ]; then
	mv ~/.vimrc_plugins ~/.vimrc_plugins.old
fi;
if [ -f ~/.vimrc_vundle ]; then
	mv ~/.vimrc_vundle ~/.vimrc_vundle.old
fi;
if [ -f ~/.gvimrc ]; then
	mv ~/.gvimrc ~/.gvimrc.old
fi;

# Create hardlinks between local vimrc files and the actual vimrc files
ln -f .vimrc ~/
ln -f .gvimrc ~/
ln -f .vimrc_vundle ~/
ln -f .vimrc_plugins ~/

# Install Vundle (https://github.com/gmarik/vundle)
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

# Clean/install bundles
vim -u .vimrc_setup

# Return to original dir
cd $OLDDIR
