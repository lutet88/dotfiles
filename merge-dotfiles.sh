#!/bin/bash
# requires git to be authenticated
# merge dotfiles from ~/, ~/.config
echo merging dotfiles...
cd ~
# want .bashrc, .inputrc, .gitconfig
cp .bashrc ~/dotfiles/home
cp .inputrc ~/dotfiles/home
cp .gitconfig ~/dotfiles/home
# want all of .config
cp -r .config/* ~/dotfiles/config/
# git push
cd ~/dotfiles
git add *
git commit -m "Update Dotfiles at {date '+%Y-%m-%d %H:%M:%S'}"
git push origin main

echo done!
