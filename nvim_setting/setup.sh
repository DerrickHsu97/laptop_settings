#!/bin/bash

nvim_path="$HOME/.config/nvim"
mkdir -p $nvim_path

# 拷贝配置
cp ./coc-settings.json $nvim_path
cp ./init.lua $nvim_path
cp -r ./lua $nvim_path

# 配置vim
cat ./profile >> $HOME/.vimrc
