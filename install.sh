#!/bin/sh
echo Installing Oh-My-Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
echo Removing default oh-my-zsh.sh
rm ~/.oh-my-zsh/oh-my-zsh.sh
echo Creating Symlink to ~/.oh-my-zsh/oh-my-zsh.sh
ln -s ~/dotfiles/oh-my-zsh.sh ~/.oh-my-zsh/oh-my-zsh.sh
echo Installing vim-plug
#https://github.com/junegunn/vim-plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo Creating ~/.config/nvim
#mkdir ~/.config/nvim
echo Creating Symlink to ~/.config/nvim/init.vim
ln -s ~/dotfiles/.config/nvim/init.vim ~/.config/nvim/init.vim

echo Installing pgcli
if ! [ -x "$(command -v pgcli)" ]; then
  pip install -U pgcli
fi
