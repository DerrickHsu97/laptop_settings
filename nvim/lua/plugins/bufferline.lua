require('bufferline').setup({
    options = {
        mode = "buffers",
        diagnostics = "coc",
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
            local s = " "
            for e, n in pairs(diagnostics_dict) do
                local sym = e == "error" and " "
                or (e == "warning" and " " or "" )
                s = s .. n .. sym
            end
            return s
        end,
        diagnostics_update_in_insert = true,
        show_tab_indicators = true,
        separator_style = "slant",
        themable = true,
        -- highlights = {
        --     buffer_selected = {
        --         fg = '#c678dd',
        --         bg = '#e70666',
        --         gui = 'bold,underline',
        --         underline = true,
        --     },
        --     indicator_selected = {
        --         fg = '#c678dd',
        --         bg = '#e70666',
        --         underline = true,
        --     },
        -- }
    }
})
