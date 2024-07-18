require("nvim-treesitter.configs").setup({
    ensure_installed = { "c", "lua", "vim", "vimdoc", "cpp", "thrift", "idl" },
    sync_install = false,
    highlight = { 
        enable = true, 
        use_languagetree = true,
        additional_vim_regex_highlighting = false,
    },
    indent = { enable = true },  
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
