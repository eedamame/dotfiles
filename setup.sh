#!/bin/bash

DOT_FILES=(.bashrc .bash_profile .eslintrc .gvimrc .slate .slate.js .sshrc .vimrc .zshrc)

for file in ${DOT_FILES[@]}
do
    ln -s $HOME/src/github.com/eedamame/dotfiles/$file $HOME/$file
done
