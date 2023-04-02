require("nvim-treesitter.configs").setup {
    ensure_installed = {
        "astro",
        "bash",
        "beancount",
        "comment",
        "css",
        "dockerfile",
        "fennel",
        "fish",
        "go",
        "gomod",
        "graphql",
        "help",
        "html",
        "java",
        "javascript",
        "jsdoc",
        "json",
        "json5",
        "jsonc",
        "latex",
        "lua",
        "markdown",
        "norg",
        "prisma",
        "python",
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
        enable = not vim.g.vscode,
        additional_vim_regex_highlighting = false,
    },
    indent = { enable = true },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "<c-enter>",
            node_incremental = "<c-enter>",
            node_decremental = "<c-backspace>",
        },
    },
    textobjects = {
        select = {
            enable = true,
            -- Automatically jump forward to textobj, similar to targets.vim
            lookahead = true,
            keymaps = {
                ["aa"] = "@parameter.outer",
                ["ia"] = "@parameter.inner",
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
    context_commentstring = { enable = true },
    matchup = {
        enable = true,
        disable = { "c", "markdown" }, -- optional, list of language that will be disabled
    },
}
