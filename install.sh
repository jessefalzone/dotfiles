#!/usr/bin/env bash

echo "Deleting the old files..."
rm ~/.vimrc
rm -R ~/.vim
rm ~/.tmux.conf
rm ~/.bashrc

echo "Symlinking new files..."
ln -s ~/dotfiles/vimrc ~/.vimrc
ln -s ~/dotfiles/vim ~/.vim
ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/bashrc ~/.bashrc

echo "Done."
