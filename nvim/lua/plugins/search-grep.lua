return {
    {
        "nvim-telescope/telescope.nvim",
        version = "*",
        event = "VeryLazy",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local telescope = require "telescope"
            local telescopeConfig = require "telescope.config"
            local actions = require "telescope.actions"

            -- Clone the default Telescope configuration
            local vimgrep_arguments = telescopeConfig.values.vimgrep_arguments
            -- I want to search in hidden/dot files.
            table.insert(vimgrep_arguments, "--hidden")
            -- I don't want to search in the `.git` directory.
            table.insert(vimgrep_arguments, "--glob")
            table.insert(vimgrep_arguments, "!**/.git/*")

            telescope.setup {
                defaults = {
                    vimgrep_arguments = vimgrep_arguments,
                    prompt_prefix = "   ",
                    selection_caret = "  ",
                    entry_prefix = "  ",
                    selection_strategy = "reset",
                    sorting_strategy = "ascending",
                    layout_strategy = "horizontal",
                    layout_config = {
                        horizontal = {
                            prompt_position = "top",
                            preview_width = 0.55,
                            results_width = 0.8,
                        },
                        vertical = {
                            mirror = false,
                        },
                        width = 0.87,
                        height = 0.80,
                        preview_cutoff = 120,
                    },
                    path_display = { "truncate" },
                    mappings = {
                        i = {
                            ["<esc>"] = actions.close,
                            ["<C-j>"] = actions.cycle_history_next,
                            ["<C-k>"] = actions.cycle_history_prev,
                        },
                        n = {
                            ["<C-n>"] = actions.move_selection_next,
                            ["<C-p>"] = actions.move_selection_previous,
                        },
                    },
                },
                pickers = {
                    buffers = {
                        show_all_buffers = true,
                        sort_lastused = true,
                        previewer = false,
                        mappings = {
                            i = { ["<c-d>"] = "delete_buffer" },
                        },
                    },
                    live_grep = {
                        mappings = {
                            i = {
                                ["<c-f>"] = function(no)
                                    actions.close(no)
                                    require("spectre").open()
                                end,
                            },
                        },
                    },
                },
            }

            require("telescope").load_extension "enhanced_find_files"
        end,
        keys = {
            {
                "<C-f>",
                mode = "n",
                "<cmd>Telescope live_grep<cr>",
                desc = "Telescope live_grep",
            },
            {
                "<space>p",
                mode = "n",
                "<cmd>Telescope enhanced_find_files<cr>",
                desc = "Telescope find files",
            },
            {
                "\\g",
                mode = "n",
                "<cmd>Telescope git_status theme=cursor previewer=false<cr>",
                desc = "Telescope git status",
            },
            {
                "<space><space>",
                mode = "n",
                "<cmd>Telescope<cr>",
                desc = "Telescope commands",
            },
        },
    },
    {
        "nvim-pack/nvim-spectre",
        event = "VeryLazy",
        opts = { open_cmd = "noswapfile vnew" },
        keys = {
            {
                "<M-f>",
                mode = "n",
                function()
                    require("spectre").open_visual { select_word = true }
                end,
                desc = "Spectre",
            },
            {
                "<M-f>",
                mode = "v",
                function()
                    require("spectre").open_visual()
                end,
                desc = "Spectre",
            },
        },
    },
}
