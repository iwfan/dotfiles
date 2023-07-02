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
        prompt_prefix = " ",
        selection_caret = "➜ ",
        path_display = { "truncate" },
        sorting_strategy = "ascending",
        layout_config = {
            prompt_position = "top",
        },
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
    },
}

require("telescope").load_extension "enhanced_find_files"

vim.keymap.set("n", "<space>p", "<cmd>Telescope enhanced_find_files theme=ivy<cr>")
vim.keymap.set("n", "<space>f", "<cmd>Telescope live_grep theme=ivy<cr>")
vim.keymap.set("n", "<space>b", "<cmd>Telescope buffers theme=ivy<cr>")
vim.keymap.set("n", "\\f", "<cmd>Telescope buffers theme=ivy<cr>")
vim.keymap.set("n", "<space>r", "<cmd>Telescope registers theme=ivy<cr>")
vim.keymap.set("n", "<space>m", "<cmd>Telescope marks theme=ivy<cr>")
vim.keymap.set("n", "<space><space>", "<cmd>Telescope<cr>")
