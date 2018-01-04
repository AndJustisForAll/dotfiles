#!/bin/sh
echo Installing vim-plug
#https://github.com/junegunn/vim-plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo Creating ~/.config/nvim
#mkdir ~/.config/nvim
echo Creating Symlink to ~/.config/nvim/init.vim
ln -s ~/dotfiles/.config/nvim/init.vim ~/.config/nvim/init.vim

