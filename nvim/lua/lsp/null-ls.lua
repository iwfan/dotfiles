local null_ls = require "null-ls"

null_ls.setup {
    sources = {
        null_ls.builtins.formatting.prettierd.with {
            env = {
                PRETTIERD_LOCAL_PRETTIER_ONLY = 1,
            },
        },
        null_ls.builtins.formatting.stylua.with {
            extra_args = { "--config-path", vim.fn.expand "~/dotfiles/stylua.toml" },
        },
    },
}
