-- Some servers have issues with backup files, see #649
vim.opt.backup = false
vim.opt.writebackup = false

-- Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
-- delays and poor user experience
vim.opt.updatetime = 300

-- Always show the signcolumn, otherwise it would shift the text each time
-- diagnostics appeared/became resolved
vim.opt.signcolumn = "yes"

-- Autocomplete
function _G.check_back_space()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

-- Use Tab for trigger completion with characters ahead and navigate
-- NOTE: There's always a completion item selected by default, you may want to enable
-- no select by setting `"suggest.noselect": true` in your configuration file
-- NOTE: Use command ':verbose imap <tab>' to make sure Tab is not mapped by
-- other plugins before putting this into your config
local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}
vim.keymap.set("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
vim.keymap.set("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)

-- Make <CR> to accept selected completion item or notify coc.nvim to format
-- <C-g>u breaks current undo, please make your own choice
vim.keymap.set("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)

-- Use `[g` and `]g` to navigate diagnostics
-- Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
vim.keymap.set("n", "[g", "<Plug>(coc-diagnostic-prev)", {silent = true})
vim.keymap.set("n", "]g", "<Plug>(coc-diagnostic-next)", {silent = true})

-- GoTo code navigation
vim.keymap.set("n", "gd", "<Plug>(coc-definition)", {silent = true})
vim.keymap.set("n", "gy", "<Plug>(coc-type-definition)", {silent = true})
vim.keymap.set("n", "gi", "<Plug>(coc-implementation)", {silent = true})
vim.keymap.set("n", "gr", "<Plug>(coc-references)", {silent = true})

vim.keymap.set("n", "<leader>f", "<Plug>(coc-format)")
vim.keymap.set("x", "<leader>f", "<Plug>(coc-format)")

-- Use K to show documentation in preview window
function _G.show_docs()
    local cw = vim.fn.expand('<cword>')
    if vim.fn.index({'vim', 'help'}, vim.bo.filetype) >= 0 then
        vim.api.nvim_command('h ' .. cw)
    elseif vim.api.nvim_eval('coc#rpc#ready()') then
        vim.fn.CocActionAsync('doHover')
    else
        vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
    end
end
vim.keymap.set("n", "<leader><leader>k", '<CMD>lua _G.show_docs()<CR>', {silent = true})


-- Highlight the symbol and its references on a CursorHold event(cursor is idle)
vim.api.nvim_create_augroup("CocGroup", {})
vim.api.nvim_create_autocmd("CursorHold", {
    group = "CocGroup",
    command = "silent call CocActionAsync('highlight')",
    desc = "Highlight symbol under cursor on CursorHold"
})


-- Symbol renaming
vim.keymap.set("n", "<leader>rn", "<Plug>(coc-rename)", {silent = true})

-- Setup formatexpr specified filetype(s)
vim.api.nvim_create_autocmd("FileType", {
    group = "CocGroup",
    pattern = "typescript,json",
    command = "setl formatexpr=CocAction('formatSelected')",
    desc = "Setup formatexpr specified filetype(s)."
})

-- Update signature help on jump placeholder
vim.api.nvim_create_autocmd("User", {
    group = "CocGroup",
    pattern = "CocJumpPlaceholder",
    command = "call CocActionAsync('showSignatureHelp')",
    desc = "Update signature help on jump placeholder"
})


-- Remap keys for apply code actions affect whole buffer.
vim.keymap.set("n", "<leader>as", "<Plug>(coc-codeaction-source)", opts)
vim.keymap.set("n", "<leader>qf", "<Plug>(coc-fix-current)", opts)

-- remap <c-f> and <c-b> to scroll float windows/popups
---@diagnostic disable-next-line: redefined-local
local opts = {silent = true, nowait = true, expr = true}
vim.keymap.set("n", "<c-f>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<c-f>"', opts)
vim.keymap.set("n", "<c-b>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<c-b>"', opts)
vim.keymap.set("i", "<c-f>",
       'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(1)<cr>" : "<right>"', opts)
vim.keymap.set("i", "<c-b>",
       'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(0)<cr>" : "<left>"', opts)
vim.keymap.set("v", "<c-f>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<c-f>"', opts)
vim.keymap.set("v", "<c-b>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<c-b>"', opts)

-- use ctrl-s for selections ranges
-- Requires 'textDocument/selectionRange' support of language server
vim.keymap.set("n", "<C-s>", "<Plug>(coc-range-select)", {silent = true})
vim.keymap.set("x", "<C-s>", "<Plug>(coc-range-select)", {silent = true})


-- Add `:Format` command to format current buffer
vim.api.nvim_create_user_command("Format", "call CocAction('format')", {})

-- " Add `:Fold` command to fold current buffer
vim.api.nvim_create_user_command("Fold", "call CocAction('fold', <f-args>)", {nargs = '?'})

-- Add `:OR` command for organize imports of the current buffer
vim.api.nvim_create_user_command("OR", "call CocActionAsync('runCommand', 'editor.action.organizeImport')", {})

-- Add (Neo)Vim's native statusline support
-- NOTE: Please see `:h coc-status` for integrations with external plugins that
-- provide custom statusline: lightline.vim, vim-airline
vim.opt.statusline:prepend("%{coc#status()}%{get(b:,'coc_current_function','')}")
-- Mappings for CoCList
-- code actions and coc stuff
---@diagnostic disable-next-line: redefined-local
local opts = {silent = true, nowait = true}
-- Show all diagnostics
vim.keymap.set("n", "<leader>la", ":<C-u>CocList diagnostics<cr>", opts)
-- Manage extensions
vim.keymap.set("n", "<leader>le", ":<C-u>CocList extensions<cr>", opts)
-- Show commands
vim.keymap.set("n", "<leader>lc", ":<C-u>CocList commands<cr>", opts)
-- Find symbol of current document
vim.keymap.set("n", "<leader>lo", ":<C-u>CocList outline<cr>", opts)
-- Search workleader symbols
vim.keymap.set("n", "<leader>ls", ":<C-u>CocList -I symbols<cr>", opts)
-- Do default action for next item
vim.keymap.set("n", "<leader>j", ":<C-u>CocNext<cr>", opts)
-- Do default action for previous item
vim.keymap.set("n", "<leader>k", ":<C-u>CocPrev<cr>", opts)
-- Resume latest coc list
vim.keymap.set("n", "<leader>lp", ":<C-u>CocListResume<cr>", opts)
vim.g.python3_host_prog = '/usr/local/bin/python3'
