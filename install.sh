#!/usr/bin/env bash

echo "Deleting the old files..."
rm ~/.vimrc
rm ~/.vim
rm ~/.tmux.conf
rm ~/.bashrc

echo "Symlinking files..."
ln -s ~/dotfiles/vimrc ~/.vimrc
ln -s ~/dotfiles/vim ~/.vim
ln -s ~/dotfiles/tmux ~/.tmux.conf
ln -s ~/dotfiles/bashrc ~/.bashrc

echo "Done."
