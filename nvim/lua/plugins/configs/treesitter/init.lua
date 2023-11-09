require("nvim-treesitter.configs").setup {
    ensure_installed = {
        "astro",
        "bash",
        "beancount",
        "comment",
        "css",
        "diff",
        "dockerfile",
        "fish",
        "git_rebase",
        "gitcommit",
        "go",
        "gomod",
        "graphql",
        "html",
        "javascript",
        "jsdoc",
        "json",
        "json5",
        "jsonc",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "regex",
        "ruby",
        "rust",
        "scheme",
        "scss",
        "sql",
        "svelte",
        "swift",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "vue",
        "yaml",
    },
    highlight = {
        enable = not vim.g.vscode,
        disable = function(lang, buf)
            local max_filesize = 300 * 1024 -- 300 KB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
                return true
            end
        end,
        additional_vim_regex_highlighting = false,
    },
    indent = { enable = not vim.g.vscode },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "<Enter>",
            node_incremental = "<Enter>",
            scope_incremental = "<C-Enter>",
            node_decremental = "<S-Enter>",
        },
    },
    textobjects = {
        move = {
            enable = true,
            set_jumps = true,
            goto_next_start = {
                ["]a"] = { query = "@parameter.inner", desc = "Next argument start" },
            },
            goto_next_end = {
                ["]A"] = { query = "@parameter.inner", desc = "Next argument end" },
            },
            goto_previous_start = {
                ["[a"] = { query = "@parameter.inner", desc = "Previous argument start" },
            },
            goto_previous_end = {
                ["[A"] = { query = "@parameter.inner", desc = "Previous argument end" },
            },
        },
        swap = {
            enable = true,
            swap_next = {
                [">A"] = { query = "@parameter.inner", desc = "Swap next argument" },
            },
            swap_previous = {
                ["<A"] = { query = "@parameter.inner", desc = "Swap previous argument" },
            },
        },
    },
    autotag = {
        enable = not vim.g.vscode,
        filetypes = { "typescriptreact", "javascriptreact", "vue", "svelte", "html", "xml", "svg" },
    },
    context_commentstring = { enable = not vim.g.vscode },
    matchup = {
        enable = not vim.g.vscode,
    },
}
