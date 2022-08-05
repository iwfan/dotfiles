local nvim_status = require "lsp-status"
nvim_status.config {
    select_symbol = function(cursor_pos, symbol)
        if symbol.valueRange then
            local value_range = {
                ["start"] = {
                    character = 0,
                    line = vim.fn.byte2line(symbol.valueRange[1]),
                },
                ["end"] = {
                    character = 0,
                    line = vim.fn.byte2line(symbol.valueRange[2]),
                },
            }

            return require("lsp-status.util").in_range(cursor_pos, value_range)
        end
    end,
    diagnostics = false,
    current_function = false,
    indicator_errors = FONT_ICON.error,
    indicator_warnings = FONT_ICON.warn,
    indicator_info = FONT_ICON.hint,
    indicator_hint = FONT_ICON.info,
    status_symbol = "  ",
    update_interval = 100,
}
