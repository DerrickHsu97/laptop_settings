require("nvim-treesitter.configs").setup({
    ensure_installed = { "c", "go", "lua", "vim", "vimdoc", "cpp", "thrift", "bash", "cmake", "json", "make", "toml"},
    sync_install = false,
    highlight = { 
        enable = true, 
        use_languagetree = true,
        additional_vim_regex_highlighting = false,
    },
    indent = { enable = false }, 
    playground = {
        enable = true,
        disable = {},
        persist_queries = false,
        updatetime = 25,
    },
    -- rainbow = {
    --     enable = true,
    --     extended_mode = ture,
    --     max_file_lines = nil,
    -- }
})

require 'colorizer'.setup()
