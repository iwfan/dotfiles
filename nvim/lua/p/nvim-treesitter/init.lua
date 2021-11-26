local M = {}

M.setup = function()
    require("nvim-treesitter.configs").setup {
        ensure_installed = {
            "bash",
            "comment",
            "css",
            "dockerfile",
            "go",
            "gomod",
            "graphql",
            "html",
            "java",
            "javascript",
            "jsdoc",
            "json",
            "json5",
            "jsonc",
            "lua",
            "python",
            "query",
            "regex",
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
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },
        indent = { enable = true },
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = "<Enter>",
                scope_incremental = "<Enter>",
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
                swap_next = { ["<leader>a"] = "@parameter.inner" },
                swap_previous = { ["<leader>A"] = "@parameter.inner" },
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
                enable = false,
            },
        },
        autotag = { enable = true },
        context_commentstring = { enable = true, enable_autocmd = false },
        matchup = {
            enable = true, -- mandatory, false will disable the whole extension
            disable = { "c", "ruby" }, -- optional, list of language that will be disabled
        },
    }
end

return M
