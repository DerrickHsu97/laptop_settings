vim.cmd [[highlight GoFunctionMethodCall guifg=#6D97F2]]
vim.cmd [[highlight GoFunctionCall guifg=#6D97F2]]
vim.cmd [[highlight GoKeyword guifg=#A646A5 gui=bold,italic]]
vim.cmd [[highlight GoTypeBuiltin guifg=#A646A5]]
vim.cmd [[highlight GoString guifg=#3DA13A]]
vim.cmd [[highlight GoBuiltin guifg=#e70666 gui=italic]]
vim.cmd [[highlight GoType guifg=#C89164]]
vim.cmd [[highlight GoTypeDefinition guifg=#C87532]]
vim.cmd [[highlight GoVariableMember guifg=#F9E07B]]
vim.cmd [[highlight GoFunctionMethod guifg=#75DCCD gui=italic]]
vim.cmd [[highlight GoOperator guifg=#FA578A]]
vim.cmd [[highlight GoProperty guifg=#BEE581]]

vim.api.nvim_set_hl(0, "@function.method.call", { link = "GoFunctionMethodCall" })
vim.api.nvim_set_hl(0, "@keyword", { link = "GoKeyword" })
vim.api.nvim_set_hl(0, "@keyword.type", { link = "GoKeyword" })
vim.api.nvim_set_hl(0, "@keyword.function", { link = "GoKeyword" })
vim.api.nvim_set_hl(0, "@keyword.conditional", { link = "GoKeyword" })
vim.api.nvim_set_hl(0, "@keyword.repeat", { link = "GoKeyword" })
vim.api.nvim_set_hl(0, "@keyword.return", { link = "GoKeyword" })
vim.api.nvim_set_hl(0, "@string", { link = "GoString" })
vim.api.nvim_set_hl(0, "@function.call", { link = "GoFunctionCall" })
vim.api.nvim_set_hl(0, "@function.builtin", { link = "GoFunctionCall" })
vim.api.nvim_set_hl(0, "@function", { link = "GoFunctionCall" })
vim.api.nvim_set_hl(0, "@function.method", { link = "GoFunctionMethod" })
vim.api.nvim_set_hl(0, "@constant.builtin", { link = "GoBuiltin" })
vim.api.nvim_set_hl(0, "@type.builtin", { link = "GoTypeBuiltin" })
vim.api.nvim_set_hl(0, "@type", { link = "GoType" })
vim.api.nvim_set_hl(0, "@type.definition", { link = "GoTypeDefinition" })
vim.api.nvim_set_hl(0, "@variable.member", { link = "GoVariableMember" })
vim.api.nvim_set_hl(0, "@variable", { link = "GoVariableMember" })
vim.api.nvim_set_hl(0, "@operator", { link = "GoOperator" })
vim.api.nvim_set_hl(0, "@property", { link = "GoProperty" })

-- coc
vim.cmd [[highlight CocWarningVirtualText guifg=#79CDCD]] 
vim.cmd [[highlight CocErrorVirtualText guifg=#FFC1C1]]
vim.cmd [[highlight CocInfoVirtualText guifg=#BEBEBE]]
vim.cmd [[highlight CocHintVirtualText guifg=#BEBEBE]]
