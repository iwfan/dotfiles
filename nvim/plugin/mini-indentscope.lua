vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
    once = true,
    callback = function()
        require("mini.indentscope").setup {
            draw = {
                animation = require("mini.indentscope").gen_animation.none(),
            },
            symbol = "│",
            options = { try_as_border = true },
        }
    end,
})
