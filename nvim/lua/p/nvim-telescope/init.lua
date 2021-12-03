local M = {}

local function keymaps()
    map_cmd("n|<space>o", "Telescope find_files")
    map_cmd("n|<space>f", "Telescope live_grep")
    map_cmd("n|<space>m", "Telescope marks")
    map_cmd("n|<C-f>", "Telescope current_buffer_fuzzy_find")
    map_cmd("n|<space><space>", "Telescope")
end

M.setup = function()
    local actions = require "telescope.actions"
    require("telescope").setup {
        defaults = {
            prompt_prefix = "  ",
            selection_caret = " ",
            sorting_strategy = "ascending",
            layout_config = {
                prompt_position = "top",
            },
            mappings = {
                i = {
                    ["<esc>"] = actions.close,
                    ["<C-j>"] = actions.move_selection_next,
                    ["<C-k>"] = actions.move_selection_previous,
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
    }

    require("telescope").load_extension "fzf"
    keymaps()
end

return M
