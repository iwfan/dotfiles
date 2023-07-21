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
    indent = { enable = true },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "<Enter>",
            node_incremental = "<Enter>",
            scope_incremental = "<C-Enter>",
            node_decremental = "<S-Enter>",
        },
    },
    autotag = {
        enable = true,
        filetypes = { "typescriptreact", "javascriptreact", "vue", "svelte", "html", "xml", "svg" },
    },
    context_commentstring = { enable = true },
    matchup = {
        enable = true,
    },
}
