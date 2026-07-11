vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
    once = true,
    callback = function()
        require("mini.comment").setup {
            options = {
                custom_commentstring = function()
                    return require("ts_context_commentstring").calculate_commentstring() or vim.bo.commentstring
                end,
            },
            mappings = {
                comment = "gc",
                comment_line = "<C-/>",
                comment_visual = "<C-/>",
                textobject = "gc",
            },
        }
    end,
})
