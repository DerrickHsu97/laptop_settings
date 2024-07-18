#!/bin/bash

git config --global user.name "xuxiaorui"
git config --global user.email "xuxiaorui@didiglobal.com"
git config --global alias.lg "log --graph --all --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"

cat ./profile >> $HOME/.bash_profile
cat ./ssh_config >> $HOME/.ssh/config
