local function open_file_search(default_text)
    local builtin = require "telescope.builtin"
    local find_command = {
        "fd",
        "--type=file",
        "--hidden",
        "--exclude=.git",
        "--exclude=.idea",
        "--exclude=node_modules",
        "--exclude=dist",
        "--exclude=out",
        "--exclude=.next",
        "--exclude=.cache",
    }

    builtin.find_files(require("telescope.themes").get_dropdown {
        previewer = false,
        find_command = find_command,
        default_text = default_text,
    })
end

return {
    {
        "nvim-telescope/telescope.nvim",
        version = "*",
        event = "VeryLazy",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local telescope = require "telescope"
            local builtin = require "telescope.builtin"
            local actions = require "telescope.actions"
            local state = require "telescope.actions.state"

            telescope.setup {
                defaults = {
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
                            ["<C-q>"] = actions.close,
                            ["<C-j>"] = actions.cycle_history_next,
                            ["<C-k>"] = actions.cycle_history_prev,
                        },
                        n = {
                            ["<C-c>"] = actions.close,
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
                    find_files = {
                        mappings = {
                            i = {
                                ["<c-s>"] = function(no)
                                    actions.close(no)
                                    local default_text = state.get_current_line()
                                    require("spectre").open_file_search {
                                        is_insert_mode = true,
                                        search_text = default_text,
                                        is_close = true,
                                    }
                                end,
                                ["<c-h>"] = function(no)
                                    actions.close(no)
                                    local default_text = state.get_current_line()
                                    builtin.oldfiles(require("telescope.themes").get_dropdown {
                                        only_cwd = true,
                                        previewer = false,
                                        default_text = default_text,
                                    })
                                end,
                                ["<c-l>"] = function(no)
                                    actions.close(no)
                                    local default_text = state.get_current_line()
                                    builtin.live_grep(require("telescope.themes").get_dropdown {
                                        default_text = default_text,
                                    })
                                end,
                            },
                        },
                    },
                    oldfiles = {
                        mappings = {
                            i = {
                                ["<c-s>"] = function(no)
                                    actions.close(no)
                                    local default_text = state.get_current_line()
                                    require("spectre").open_file_search {
                                        is_insert_mode = true,
                                        search_text = default_text,
                                        is_close = true,
                                    }
                                end,
                                ["<c-l>"] = function(no)
                                    actions.close(no)
                                    local default_text = state.get_current_line()
                                    open_file_search(default_text)
                                end,
                            },
                        },
                    },
                    live_grep = {
                        mappings = {
                            i = {
                                ["<c-s>"] = function(no)
                                    actions.close(no)
                                    local default_text = state.get_current_line()
                                    require("spectre").open {
                                        is_insert_mode = true,
                                        search_text = default_text,
                                        is_close = true,
                                    }
                                end,
                                ["<c-h>"] = function(no)
                                    actions.close(no)
                                    local default_text = state.get_current_line()
                                    builtin.oldfiles(require("telescope.themes").get_dropdown {
                                        only_cwd = true,
                                        previewer = false,
                                        default_text = default_text,
                                    })
                                end,
                                ["<c-l>"] = function(no)
                                    actions.close(no)
                                    local default_text = state.get_current_line()
                                    open_file_search(default_text)
                                end,
                            },
                        },
                    },
                },
            }
        end,
        keys = {
            {
                "<space>f",
                mode = "n",
                "<cmd>Telescope live_grep theme=dropdown<cr>",
                desc = "Telescope live_grep",
            },
            {
                "<space>p",
                mode = "n",
                function()
                    open_file_search()
                end,
                desc = "Telescope find files",
            },
            {
                "<space>b",
                mode = { "n" },
                "<cmd>Telescope buffers theme=dropdown only_cwd=true ignore_current_buffer=true<cr>",
                desc = "Show Buffer",
            },
            {
                "<space>s",
                mode = "n",
                "<cmd>Telescope git_status theme=dropdown previewer=false<cr>",
                desc = "Telescope git status",
            },
            {
                "<space>m",
                mode = "n",
                "<cmd>Telescope marks theme=dropdown<cr>",
                desc = "Telescope marks",
            },
            {
                "<space>j",
                mode = "n",
                "<cmd>Telescope jumplist theme=dropdown<cr>",
                desc = "Telescope jumplist",
            },
            {
                "<space><space>",
                mode = "n",
                "<cmd>Telescope commands theme=dropdown<cr>",
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
