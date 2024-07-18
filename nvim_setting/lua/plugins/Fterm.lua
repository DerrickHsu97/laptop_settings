local path = vim.fn.getcwd()
require'FTerm'.setup({
    border = 'double',
    cmd = 'su - didi -c "cd ' .. path .. ' && exec zsh"',
    dimensions  = {
        height = 0.9,
        width = 0.9,
    },
})
