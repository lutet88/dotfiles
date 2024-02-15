#!/bin/bash

# requires: 
# curl
# git
# building fish: c++11, cmake, ncurses

# set up directories
echo 
echo creating directories...
cd ~/
mkdir .config
mkdir .local
mkdir .local/bin

# install micro
echo
echo installing micro...
curl https://getmic.ro | bash

# micro should install into ./micro
echo
echo moving micro...
mv ./micro ~/.local/bin

# install fish 3.7.0
echo
echo installing fish...
git clone -b "3.7.0" https://github.com/fish-shell/fish-shell.git
cd fish-shell
mkdir build
cd build
echo building...
cmake -DCMAKE_INSTALL_PREFIX=~/.local/bin ..
make -j12
sudo make install
cd ../..

# install zoxide
echo
echo installing zoxide...
curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash

# clone this repo
echo
echo importing dotfiles...
git clone https://github.com/lutet88/dotfiles
cd dotfiles
cp -r config/* ~/.local/config/
cp -r home/* ~/
cp update-dotfiles.sh ~/.local/bin/
cd ..

# install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# install micro plugins
echo
echo installing micro plugins...

~/.local/bin/micro -plugin install fish
~/.local/bin/micro -plugin install wc
~/.local/bin/micro -plugin install jump
~/.local/bin/micro -plugin install bounce

# clean up
echo
echo cleaning up...
cd ~
rm -rf fish-shell
rm -rf dotfiles

echo done!
