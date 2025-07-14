return {
    { "nvim-lua/plenary.nvim" },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        lazy = false,
        config = function()
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
                    "python",
                    "ruby",
                    "rust",
                    "scss",
                    "svelte",
                    "toml",
                    "tsx",
                    "typescript",
                    "vim",
                    "vue",
                    "yaml",
                },
                sync_install = false,
                auto_install = true,
                ignore_install = {},
                modules = {},
                highlight = {
                    enable = not vim.g.vscode,
                    disable = function(lang, buf)
                        local max_filesize = 100 * 1024 -- 100 KB
                        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                        if ok and stats and stats.size > max_filesize then
                            return true
                        end
                    end,
                    additional_vim_regex_highlighting = false,
                },
                indent = { enable = not vim.g.vscode },
                incremental_selection = { enable = false },
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
                matchup = {
                    enable = not vim.g.vscode,
                },
            }
        end,
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
        },
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
    },
}
