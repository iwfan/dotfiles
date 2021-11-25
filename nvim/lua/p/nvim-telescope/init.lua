local M = {}

local function keymaps()
    map_cmd("n|<M-p>", "lua require'p.nvim-telescope.find_files'.find()")
    map_cmd("n|<M-f>", "Telescope current_buffer_fuzzy_find")
    map_cmd("n|<M-S-f>", "lua require'p.nvim-telescope.find_files'.grep()")
    map_cmd("n|<M-S-p>", "Telescope")
end

M.setup = function()
    local actions = require "telescope.actions"
    require("telescope").setup {
        defaults = {
            prompt_prefix = " ❯ ",
            selection_caret = "❯ ",
            sorting_strategy = "ascending",
            layout_config = {
                prompt_position = "top",
            },
            mappings = {
                i = {
                    ["<C-j>"] = actions.move_selection_next,
                    ["<C-k>"] = actions.move_selection_previous,
                    ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
                    ["<Esc>"] = actions.close,
                    ["<Tab>"] = actions.toggle_selection + actions.move_selection_next,
                    ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_previous,
                },
                n = {
                    ["<C-j>"] = actions.move_selection_next,
                    ["<C-k>"] = actions.move_selection_previous,
                    ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
                },
            },
            -- extensions = {
            --     fzf = {
            --         override_generic_sorter = false,
            --         override_file_sorter = true,
            --         case_mode = "smart_case",
            --     },
            -- },
        },
    }

    -- require("telescope").load_extension "fzf"
    keymaps()
end

return M
