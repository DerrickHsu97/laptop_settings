-- vim.fn.setenv('http_proxy', 'http://127.0.0.1:1087')
-- vim.fn.setenv('https_proxy', 'https://127.0.0.1:1087')
-- vim.fn.setenv('ALL_PROXY', '27.0.0.1:1087')
local opt = vim.opt

opt.number = true

-- 换行
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true
opt.jumpoptions = "stack"

-- 鼠标
opt.cursorline = true
opt.mouse:append("a")

-- 剪贴板
opt.clipboard:append("unnamedplus")

-- 搜索
opt.ignorecase = true
opt.smartcase = true

-- 外观
opt.termguicolors = true
opt.signcolumn = "yes"
-- opt.smartindent = true
-- vim.o.smartindent = true
-- vim.bo.smartindent = true
-- vim.bo.autoindent = true
-- vim.o.autoindent = true
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8
