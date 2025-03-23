set -e
log_info() { echo -e "\033[32mINFO\t$(date '+%Y-%m-%d %H:%M:%S')\t$1\033[0m"; }
log_error() { echo -e "\033[31mERROR\t$(date '+%Y-%m-%d %H:%M:%S')\t$1\033[0m"; }

OS="unknown"
if [[ "$(uname)" == "Darwin" ]]; then
    OS="macos"
elif [[ -f /etc/os-release ]]; then
    . /etc/os-release
    if [[ "$ID" == "ubuntu" ]]; then
        OS="ubuntu"
    elif [[ "$ID" == "centos" || "$ID_LIKE" == *"rhel"* ]]; then
        OS="centos"
    else
        log_error "Error: unknown os"
        exit 1
    fi
else 
    log_error "Error: unknown os"
    exit 1
fi

log_info "OS=${OS}"

CUR_DIR=$(pwd)
mkdir -p $HOME/derrick_config
cd $HOME/derrick_config
if [ ! -f "$CUR_DIR/.derrick_profile" ]; then
    touch .derrick_profile
fi

# 安装依赖
log_info "========== Download&Install Neovim... =========="
if [ ! -d "$HOME/derrick_config/nvim-linux-arm64" ]; then
    wget https://github.com/neovim/neovim/releases/download/v0.10.4/nvim-linux-arm64.tar.gz
    tar -zxvf nvim-linux-arm64.tar.gz
    echo "export PATH:$PATH:$HOME/derrick_config/nvim-linux-arm64/bin" >> ./.derrick_profile
fi
log_info "========== Done! =========="

log_info "========== Download&Install ripgrep... =========="
if [ ! -d "$HOME/derrick_config/ripgrep-14.1.1-x86_64-unknown-linux-musl" ]; then
    wget https://github.com/BurntSushi/ripgrep/releases/download/14.1.1/ripgrep-14.1.1-x86_64-unknown-linux-musl.tar.gz
    tar -zxvf ripgrep-14.1.1-x86_64-unknown-linux-musl.tar.gz
    echo "export PATH:$PATH:$HOME/derrick_config/ripgrep-14.1.1-x86_64-unknown-linux-musl" >> ./.derrick_profile
fi
log_info "========== Done! =========="

log_info "========== Download&Install clangd... =========="
if [ ! -d "$HOME/derrick_config/clangd_19.1.2" ]; then
    wget https://github.com/clangd/clangd/releases/download/19.1.2/clangd-linux-19.1.2.zip
    unzip ./clangd-linux-19.1.2.zip
    echo "export PATH:$PATH:$HOME/derrick_config/clangd_19.1.2/bin" >> ./.derrick_profile
fi
log_info "========== Done! =========="

log_info "========== Download&Install Nodejs... =========="
if [ ! -d "$HOME/.nvm" ]; then
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.2/install.sh | bash
    \. "$HOME/.nvm/nvm.sh"
    nvm install 22
fi
log_info "========== Done! =========="

log_info "========== Install&Config Nvim... =========="
if [ ! -d "~/.local/share/nvim/site/pack/packer/start/packer.nvim" ]; then
    cp -r $CUR_DIR/packer.nvim ~/.local/share/nvim/site/pack/packer/start
    cp -r $CUR_DIR/nvim $HOME/.config
fi
log_info "========== Done! =========="

cd $HOME/derrick_config
# 设置快捷方式
echo "export PATH:$PATH:$CUR_DIR/shell" >> ./.derrick_profile
echo "alias xmake='generate_cpp_compile_commands_cmake'" >> ./.derrick_profile
echo "alias cppformat='cp ${CUR_DIR}/.clang-format ./'" >> ./.derrick_profile
mv ./.derrick_profile $HOME
