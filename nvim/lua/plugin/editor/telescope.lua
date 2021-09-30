local actions = require("telescope.actions")
require("telescope").setup({
    defaults = {
        prompt_prefix = "🔭 ",
        selection_caret = "👉 ",
        entry_prefix = "  ",
        sorting_strategy = "ascending",
        file_sorter = require("telescope.sorters").get_fuzzy_file,
        file_ignore_patterns = {},
        generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
        winblend = 10,
        preview_height = 1,
        preview_width = 0.8,
        color_devicons = true,
        use_less = true,
        set_env = { ["COLORTERM"] = "truecolor" },
        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
        layout_config = {
            prompt_position = "top",
            width = 0.75,
            preview_cutoff = 120,
        },
        mappings = {
            i = {
                ["<c-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
            },
        },
        extensions = {
            fzy_native = {
                override_generic_sorter = false,
                override_file_sorter = true,
            },
        },
    },
})

require("telescope").load_extension("fzy_native")

map("n|<C-f>", "")
map_cmd("n|<C-f>a", "Telescope find_files")
map_cmd("n|<C-f>b", "Telescope buffers")
map_cmd("n|<C-f>c", "Telescope current_buffer_fuzzy_find")
map_cmd("n|<C-f>e", "Telescope file_browser")
map_cmd("n|<C-f>f", "Telescope git_files")
map_cmd("n|<C-f>g", "Telescope git_status")
map_cmd("n|<C-f>o", "Telescope oldfiles")
map_cmd("n|<C-f>w", "Telescope live_grep")
map_cmd("n|<C-f>h", "Telescope help_tags")
map_cmd("n|<C-f>l", "Telescope loclist")
map_cmd("n|<C-f>r", "Telescope registers")
map_cmd("n|<C-f>m", "Telescope marks")
map_cmd("n|<C-f>k", "Telescope keymaps")
