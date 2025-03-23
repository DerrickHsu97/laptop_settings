require('telescope').setup({})
-- 支持搜索光标字符
function vim.getVisualSelection()
    vim.cmd('noau normal! "vy"')
    local text = vim.fn.getreg('v')
    vim.fn.setreg('v', {})

    text = string.gsub(text, "\n", "")
    if #text > 0 then
        return text
    else
        return ''
    end
end
vim.keymap.set(
    'v', 
    '<leader>fg', 
    function()
        require('telescope').extensions.live_grep_args.live_grep_args({default_text = vim.getVisualSelection()})
        --require('telescope.builtin').live_grep({default_text = vim.getVisualSelection()})
    end, 
    { noremap = true, silent = true }
)
