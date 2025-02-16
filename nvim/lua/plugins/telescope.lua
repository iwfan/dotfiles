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

    builtin.find_files({
        find_command = find_command,
        default_text = default_text,
    })
end

return {
    {
        "nvim-telescope/telescope.nvim",
        version = "*",
        event = "VeryLazy",
        dependencies = {
            { "nvim-lua/plenary.nvim" },
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
            { "nvim-telescope/telescope-ui-select.nvim" }
        },
        config = function()
            local telescope = require "telescope"
            local builtin = require "telescope.builtin"
            local actions = require "telescope.actions"
            local state = require "telescope.actions.state"

            telescope.setup {
                defaults = {
                    prompt_prefix = " -> ",
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
                    borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
                    mappings = {
                        i = {
                            ["<esc>"] = actions.close,
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
                                    builtin.oldfiles({
                                        only_cwd = true,
                                        default_text = default_text,
                                    })
                                end,
                                ["<c-l>"] = function(no)
                                    actions.close(no)
                                    local default_text = state.get_current_line()
                                    builtin.live_grep({
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
                                    builtin.oldfiles({
                                        only_cwd = true,
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
                    lsp_references = {
                        show_line = false,
                    }
                },
                extensions = {
                    fzf = {
                        fuzzy = true, -- false will only do exact matching
                        override_generic_sorter = true, -- override the generic sorter
                        override_file_sorter = true, -- override the file sorter
                        case_mode = "smart_case", -- or "ignore_case" or "respect_case"
                        -- the default case_mode is "smart_case"
                    },
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown {
                        }
                    }
                },
            }

            telescope.load_extension('fzf')
            telescope.load_extension("ui-select")
        end,
        keys = {
            {
                "<space>f",
                mode = "n",
                "<cmd>Telescope buffers only_cwd=true ignore_current_buffer=true<cr>",
                desc = "Telescope live_grep",
            },
            {
                "<space>/",
                mode = "n",
                "<cmd>Telescope live_grep<cr>",
                desc = "Telescope live_grep",
            },
            {
                "<space>p",
                mode = "n",
                open_file_search,
                desc = "Telescope find files",
            },
            {
                "<space>o",
                mode = "n",
                "<cmd>Telescope oldfiles only_cwd=true<cr>",
                desc = "Telescope find files",
            },
            {
                "<space>b",
                mode = "n",
                "<cmd>Telescope buffers only_cwd=true ignore_current_buffer=true<cr>",
                desc = "Telescope find files",
            },
            {
                "<space>d",
                mode = "n",
                "<cmd>Telescope diagnostics<cr>",
                desc = "Telescope find files",
            },
            {
                "<space>j",
                mode = "n",
                "<cmd>Telescope jumplist<cr>",
                desc = "Telescope find files",
            },
            {
                "<space>g",
                mode = "n",
                "<cmd>Telescope git_status<cr>",
                desc = "Telescope git status",
            },
            {
                "<space>'",
                mode = "n",
                "<cmd>Telescope resume<cr>",
                desc = "Telescope find files",
            },
            {
                "<space>?",
                mode = "n",
                "<cmd>Telescope commands theme=dropdown<cr>",
                desc = "Telescope commands",
            },
        },
    },
}
