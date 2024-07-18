nvim_path = ~/.config/nvim
mkdir -p $nvim_path

# 拷贝配置
cp ./coc-settings.json $nvim_path
cp ./init.lua $nvim_path
cp -r ./lua $nvim_path
