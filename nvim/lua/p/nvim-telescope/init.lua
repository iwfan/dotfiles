local M = {}

M.setup = function()
    local actions = require "telescope.actions"
    require("telescope").setup {
        defaults = {
            vimgrep_arguments = {
                "rg",
                "--color=never",
                "--no-heading",
                "--with-filename",
                "--line-number",
                "--column",
                "--smart-case",
                "--hidden",
                "--glob=!.git/",
            },
            prompt_prefix = " ",
            selection_caret = " ",
            sorting_strategy = "ascending",
            layout_config = {
                prompt_position = "top",
            },
            mappings = {
                i = {
                    ["<C-n>"] = actions.move_selection_next,
                    ["<C-p>"] = actions.move_selection_previous,
                    ["<C-c>"] = actions.close,
                    ["<C-j>"] = actions.cycle_history_next,
                    ["<C-k>"] = actions.cycle_history_prev,
                    ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
                    ["<CR>"] = actions.select_default + actions.center,
                },
                n = {
                    ["<C-n>"] = actions.move_selection_next,
                    ["<C-p>"] = actions.move_selection_previous,
                    ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
                },
            },
            extensions = {
                fzf = {
                    fuzzy = true, -- false will only do exact matching
                    override_generic_sorter = true, -- override the generic sorter
                    override_file_sorter = true, -- override the file sorter
                    case_mode = "smart_case",
                },
            },
        },
        pickers = {
            find_files = {
                find_command = {
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
                },
            },
            oldfiles = {
                only_cwd = true,
            },
            live_grep = {
                --@usage don't include the filename in the search results
                only_sort_text = true,
            },
        },
    }

    require("telescope").load_extension "fzf"

    map_cmd("n|<space>o", "Telescope oldfiles theme=ivy")
    map_cmd("n|<space>p", "Telescope find_files theme=ivy")
    map_cmd("n|<space>f", "Telescope live_grep theme=ivy")
    map_cmd("n|<space>b", "Telescope buffers theme=cursor")
    map_cmd("n|<space>r", "Telescope registers theme=ivy")
    map_cmd("n|<space>m", "Telescope marks theme=ivy")
    map("n|<space><space>", ":Telescope <space>")
end

return M
