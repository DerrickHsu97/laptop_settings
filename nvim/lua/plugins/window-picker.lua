require'window-picker'.setup({
    -- autoselect_one = true,
    hint = 'floating-big-letter',
    filter_rules = {
        -- 如果你有 nvim-tree 打开，可以添加以下规则来避免选择到 nvim-tree 窗口
        include_current_win = true,
        bo = {
            filetype = { 'NvimTree' },
            buftype = { 'terminal' }
        },
    },
})

