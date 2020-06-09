#!/usr/bin/env bash
rm -rf ~/.dotfiles
mkdir ~/.dotfiles
cp ./* ~/.dotfiles

echo zsh
rm ~/.zshrc
ln -s ~/.dotfiles/zshrc ~/.zshrc

echo tmux
rm ~/.tmux.conf
ln -s ~/.dotfiles/tmux.conf ~/.tmux.conf

echo vim
rm -rf ~/.vim
mkdir ~/.vim
ln -s ~/.dotfiles/vimrc ~/.vim/vimrc
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
