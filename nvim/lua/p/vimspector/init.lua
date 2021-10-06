local M = {}

M.setup = function()
    vim.fn.sign_define("vimspectorBP", { text = " ●", texthl = "VimspectorBreakpoint" })
    vim.fn.sign_define("vimspectorBPCond", { text = " ●", texthl = "VimspectorBreakpointCond" })
    vim.fn.sign_define("vimspectorBPDisabled", { text = " ●", texthl = "VimspectorBreakpointDisabled" })
    vim.fn.sign_define(
        "vimspectorPC",
        { text = "▶", texthl = "VimspectorProgramCounter", linehl = "VimspectorProgramCounterLine" }
    )
    vim.fn.sign_define("vimspectorPCBP", {
        text = "●▶",
        texthl = "VimspectorProgramCounterBreakpoint",
        linehl = "VimspectorProgramCounterLine",
    })
end

return M
