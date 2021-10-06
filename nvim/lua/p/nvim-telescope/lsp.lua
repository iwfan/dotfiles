local builtin = require "telescope.builtin"

local M = {}

M.workspace_symbols = function()
    local query = vim.fn.input "Query >"
    if query then
        vim.cmd("Telescope lsp_workspace_symbols query=" .. query)
    else
        builtin.lsp_workspace_symbols()
    end
end

return M
