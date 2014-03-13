#!/usr/bin/env bash

echo "Deleting the old files..."
rm ~/.vimrc
rm -R ~/.vim
rm ~/.tmux.conf
rm ~/.bashrc
rm ~/.bash_aliases
rm ~/.bash_profile

echo "Symlinking new files..."
ln -s ~/dotfiles/vimrc ~/.vimrc
ln -s ~/dotfiles/vim ~/.vim
ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/bashrc ~/.bashrc
ln -s ~/dotfiles/bash_aliases ~/.bash_aliases
ln -s ~/dotfiles/bash_profile ~/.bash_profile

echo "Install complete."
