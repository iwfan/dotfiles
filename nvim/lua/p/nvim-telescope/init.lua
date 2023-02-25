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
        prompt_prefix = " ",
        selection_caret = " ",
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
                ["<CR>"] = actions.select_default + actions.center,
            },
            n = {
                ["<C-n>"] = actions.move_selection_next,
                ["<C-p>"] = actions.move_selection_previous,
                ["q"] = actions.close,
            },
        },
    },
    pickers = {
        live_grep = {
            --@usage don't include the filename in the search results
            only_sort_text = true,
        },
    },
}

require("telescope").load_extension "enhanced_find_files"

vim.keymap.set("n", "<space>p", "<cmd>Telescope enhanced_find_files<cr>")
vim.keymap.set("n", "<space>f", "<cmd>Telescope live_grep<cr>")
vim.keymap.set("n", "<space>b", "<cmd>Telescope buffers<cr>")
vim.keymap.set("n", "<space>r", "<cmd>Telescope registers<cr>")
vim.keymap.set("n", "<space>m", "<cmd>Telescope marks<cr>")
vim.keymap.set("n", "<space><space>", "<cmd>Telescope <space>")
