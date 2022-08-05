vim.opt.foldlevelstart = 99
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.indentexpr = "nvim_treesitter#indent()"

require("nvim-treesitter.configs").setup {
    ensure_installed = {
        "astro",
        "bash",
        "beancount",
        "c",
        "clojure",
        "cmake",
        "comment",
        "css",
        "dart",
        "dockerfile",
        "fennel",
        "fish",
        "go",
        "gomod",
        "graphql",
        "html",
        "http",
        "java",
        "javascript",
        "jsdoc",
        "json",
        "json5",
        "jsonc",
        "kotlin",
        "latex",
        "lua",
        "markdown",
        "nix",
        "norg",
        "prisma",
        "pug",
        "python",
        "query",
        "regex",
        "ruby",
        "rust",
        "scala",
        "scheme",
        "scss",
        "svelte",
        "swift",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "vue",
        "yaml",
        "zig",
    },
    highlight = {
        enable = true,
    },
    indent = { enable = true },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "<Enter>",
            node_incremental = "<Enter>",
            node_decremental = "<BS>",
        },
    },
    textobjects = {
        select = {
            enable = true,
            -- Automatically jump forward to textobj, similar to targets.vim
            lookahead = true,
            keymaps = {
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner",
            },
        },
        swap = {
            enable = true,
            swap_next = { ["ga"] = "@parameter.inner" },
            swap_previous = { ["gA"] = "@parameter.inner" },
        },
        move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
                ["]m"] = "@function.outer",
                ["]]"] = "@class.outer",
            },
            goto_next_end = {
                ["]M"] = "@function.outer",
                ["]["] = "@class.outer",
            },
            goto_previous_start = {
                ["[m"] = "@function.outer",
                ["[["] = "@class.outer",
            },
            goto_previous_end = {
                ["[M"] = "@function.outer",
                ["[]"] = "@class.outer",
            },
        },
        lsp_interop = {
            enable = true,
            border = "none",
            peek_definition_code = {
                ["<space>df"] = "@function.outer",
                ["<space>dF"] = "@class.outer",
            },
        },
    },
    autotag = {
        enable = true,
        filetypes = { "typescriptreact", "javascriptreact", "vue", "svelte", "html", "xml", "svg" },
    },
    context_commentstring = { enable = true, enable_autocmd = false },
}
