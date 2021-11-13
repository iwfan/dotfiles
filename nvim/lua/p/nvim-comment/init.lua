local M = {}

local function update_commentstring()
    local filetypes = {
        "javascript",
        "typescript",
        "javascriptreact",
        "typescriptreact",
        "html",
        "vue",
    }
    if vim.tbl_contains(filetypes, vim.bo.filetype) then
        require("ts_context_commentstring.internal").update_commentstring()
    end
end

M.setup = function()
    require("Comment").setup {
        pre_hook = function()
            return require("ts_context_commentstring.internal").calculate_commentstring()
        end,
    }
    local ft = require "Comment.ft"
    ft.set("json", { "//%s" })
    map_cmd([[n|<M-/>]], "lua require('Comment').toggle()")
end

return M
