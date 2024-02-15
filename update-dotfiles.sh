#!/bin/bash

# requires: 

# set up directories
echo creating directories...
cd ~/
mkdir .config
mkdir .local
mkdir .local/bin

# install micro
echo installing micro...
curl https://getmic.ro | bash

# micro should install into ./micro
echo moving micro...
mv ./micro ~/.local/bin

# install fish 3.7.0
echo installing fish...
git clone -b "3.7.0" https://github.com/fish-shell/fish-shell.git
cd fish-shell
mkdir build
cd build
echo building...
cmake -DCMAKE_INSTALL_PREFIX=~/.local/bin ..
make
sudo make install
cd ../..

# install zoxide
echo installing zoxide...
curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash

# clone this repo
echo importing dotfiles...
git clone https://github.com/lutet88/dotfiles
cd dotfiles
cp -r config/* ~/.local/config/
cp -r home/* ~/
cp update-dotfiles.sh ~/.local/bin/
cd ..

# install micro plugins
echo installing micro plugins...
alias mc=~/.local/bin/micro
mc -plugin install fish
mc -plugin install wc
mc -plugin install jump
mc -plugin install bounce



echo done!
