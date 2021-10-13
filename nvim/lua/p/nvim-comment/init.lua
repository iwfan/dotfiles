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

M.setup_nvim_comment = function()
    require("nvim_comment").setup {
        comment_empty = false,
        hook = update_commentstring,
    }
    map_cmd("n|<C-_>", "CommentToggle")
end

M.setup = function()
    require("Comment").setup {
        ignore = "^$",
        mappings = {
            ---operator-pending mapping
            ---Includes `gcc`, `gcb`, `gc[count]{motion}` and `gb[count]{motion}`
            basic = true,
            ---extended mapping
            ---Includes `g>`, `g<`, `g>[count]{motion}` and `g<[count]{motion}`
            extra = true,
        },
        pre_hook = update_commentstring,
    }
    local lang = require "Comment.lang"
    lang.set("json", { "//%s" })
    map_cmd("n|<C-_>", "lua require('Comment').toggle()")
end

return M
