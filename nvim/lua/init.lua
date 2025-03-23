local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()
vim.g.coc_global_extensions = {'coc-snippets', 'coc-pairs', 'coc-clang-format-style-options', 'coc-pyright', 'coc-lua', 'coc-json', 'coc-go', 'coc-cmake'}

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'numToStr/Comment.nvim'
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional
        },
    }
    use 'tanvirtin/monokai.nvim'
    use 'vim-airline/vim-airline'
    use 'vim-airline/vim-airline-themes'
    use 'nvim-treesitter/nvim-treesitter'
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.6',
        requires = { {'nvim-lua/plenary.nvim'}, {"nvim-telescope/telescope-live-grep-args.nvim" } }
    }
    use 'numToStr/FTerm.nvim'
    use 'nvim-treesitter/playground'
    use 'norcalli/nvim-colorizer.lua'
    use({
        "nvim-treesitter/nvim-treesitter-textobjects",
        after = "nvim-treesitter",
        requires = "nvim-treesitter/nvim-treesitter",
    })
    use {'neoclide/coc.nvim', branch = 'release'}
    use {'akinsho/bufferline.nvim', requires = 'nvim-tree/nvim-web-devicons'}
    use({
        "utilyre/barbecue.nvim",
        tag = "*",
        requires = {
            "SmiteshP/nvim-navic",
            "nvim-tree/nvim-web-devicons", -- optional dependency
        },
    })
    use 'lukas-reineke/indent-blankline.nvim'
    -- git
    use 'f-person/git-blame.nvim'
    use 'petertriho/nvim-scrollbar'
    use {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup()
            require("scrollbar.handlers.gitsigns").setup()
        end
    }
    use {
        's1n7ax/nvim-window-picker',
        tag = 'v2.*',
        -- config = function()
        --     require'window-picker'.setup()
        -- end,
    }
    use 'tpope/vim-fugitive'
    use 'easymotion/vim-easymotion'
    -- use 'vidocqh/auto-indent.nvim'

    if packer_bootstrap then
        require('packer').sync()
    end
end)
