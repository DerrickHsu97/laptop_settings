vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("i", "jk", "<ESC>")
keymap.set("n", "q", ":q<CR>")
keymap.set("n", "Q", ":q!<CR>")

keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

keymap.set("n", "<leader>nh", ":nohl<CR>")

keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")
keymap.set("n", "<F>", ":NvimTreeFindFile<CR>")
keymap.set("n", "<C-c>", ":BufferLinePickClose<CR>")

-- move window
keymap.set("n", "<C-j>", "<C-w>j")
keymap.set("n", "<C-k>", "<C-w>k")
keymap.set("n", "<C-l>", "<C-w>l")
keymap.set("n", "<C-h>", "<C-w>h")
keymap.set("n", "<C-q>", "<C-w>q")
keymap.set("n", "<C-+>", ":resize +2<CR>")
keymap.set("n", "<C-_>", ":resize -2<CR>")
keymap.set("n", "<C->>", ":vertical resize +2<CR>")
keymap.set("n", "<C-<>", ":vertical resize -2<CR>")

-- bufferline
keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>")
keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>")
keymap.set("n", "<leader>cr", ":BufferLineCloseRight<CR>")
keymap.set("n", "<leader>cl", ":BufferLineCloseLeft<CR>")
-- keymap.set("n", "<Tab>", ":bn<CR>")
-- keymap.set("n", "<S-Tab>", ":bp<CR>")

-- telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- 终端
vim.keymap.set('n', '<leader><leader>t', '<CMD>lua require("FTerm").toggle()<CR>')
vim.keymap.set('t', '<leader><leader>t', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')

local picker = require('window-picker')
-- 定义一个函数来跳转到选定的窗口
function GotoPickedWindow()
  local picked_window_id = picker.pick_window()
  if picked_window_id ~= nil then
    vim.api.nvim_set_current_win(picked_window_id)
  end
end

-- 设置快捷键来调用上述函数
vim.api.nvim_set_keymap('n', '<Leader><Leader>w', "<CMD>lua GotoPickedWindow()<CR>", { noremap = true, silent = true })
