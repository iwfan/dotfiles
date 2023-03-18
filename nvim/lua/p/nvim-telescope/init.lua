local telescope = require "telescope"
local telescopeConfig = require "telescope.config"
local actions = require "telescope.actions"

-- Clone the default Telescope configuration
local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }
-- I want to search in hidden/dot files.
table.insert(vimgrep_arguments, "--hidden")
-- I don't want to search in the `.git` directory.
table.insert(vimgrep_arguments, "--glob")
table.insert(vimgrep_arguments, "!**/.git/*")

telescope.setup {
    defaults = {
        vimgrep_arguments = vimgrep_arguments,
        prompt_prefix = " ",
        selection_caret = " ",
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
        },
    },
    pickers = {
        -- enhanced_find_files = {theme = "ivy", layout_config = {height = 0.4}},
        -- find_files = {theme = "ivy", layout_config = {height = 0.4}},
        -- git_files = {theme = "ivy", layout_config = {height = 0.4}},
        -- live_grep = {theme = "ivy", only_sort_text = true, layout_config = {height = 0.4}},
        -- buffers = {theme = "ivy", layout_config = {height = 0.4}},
        -- keymaps = {theme = "ivy", layout_config = {height = 0.4}},
        -- file_browser = {theme = "ivy", layout_config = {height = 0.4}},
        -- treesitter = {theme = "ivy", layout_config = {height = 0.4}},
        -- help_tags = {theme = "ivy", layout_config = {height = 0.5}},
        -- man_pages = {
        --     sections = {"1", "2", "3"},
        --     theme = "ivy",
        --     layout_config = {height = 0.4}
        -- }
    },
}

require("telescope").load_extension "enhanced_find_files"

vim.keymap.set("n", "<space>p", "<cmd>Telescope enhanced_find_files<cr>")
vim.keymap.set("n", "<space>f", "<cmd>Telescope live_grep<cr>")
vim.keymap.set("n", "<space>b", "<cmd>Telescope buffers<cr>")
vim.keymap.set("n", "<space>r", "<cmd>Telescope registers<cr>")
vim.keymap.set("n", "<space>m", "<cmd>Telescope marks<cr>")
vim.keymap.set("n", "<space><space>", "<cmd>Telescope <space>")
