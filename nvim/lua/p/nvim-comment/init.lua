local M = {}

M.setup = function()
    require("nvim_comment").setup {
        comment_empty = false,
        hook = function()
            local filetypes = {
                "javascript",
                "typescript",
                "javascriptreact",
                "typescriptreact",
                "html",
                "vue",
            }
            local curr_filetype = vim.api.nvim_buf_get_option(0, "filetype")
            if vim.tbl_contains(filetypes, curr_filetype) then
                require("ts_context_commentstring.internal").update_commentstring()
            end
        end,
    }
    map_cmd("n|<C-_>", "CommentToggle")
end

return M
