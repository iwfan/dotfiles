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

map_cmd("n|<C-f>f", "lua require('telescope.builtin').find_files()")
map_cmd("n|<C-f>e", "lua require('telescope.builtin').file_browser()")
map_cmd("n|<C-f>g", "lua require('telescope.builtin').git_files()")
map_cmd("n|<C-f>o", "lua require('telescope.builtin').oldfiles()")
map_cmd("n|<C-f>b", "lua require('telescope.builtin').buffers()")
map_cmd("n|<C-f>w", "lua require('telescope.builtin').live_grep()")
map_cmd("n|<C-f>h", "lua require('telescope.builtin').help_tags()")
map_cmd("n|<C-f>l", "lua require('telescope.builtin').loclist()")
map_cmd("n|<C-f>r", "lua require('telescope.builtin').registers()")
map_cmd("n|<C-f>c", "lua require('telescope.builtin').current_buffer_fuzzy_find()")
map_cmd("n|<C-f>m", "lua require('telescope.builtin').marks()")
