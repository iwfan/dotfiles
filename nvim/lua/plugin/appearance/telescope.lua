local actions = require('telescope.actions')
require("telescope").setup {
  defaults = {
    vimgrep_arguments    = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case"
    },
    prompt_position      = "top",
    prompt_prefix        = "🔭 ",
    selection_caret      = "👉 ",
    entry_prefix         = "  ",
    sorting_strategy     = "ascending",
    file_sorter          = require "telescope.sorters".get_fuzzy_file,
    file_ignore_patterns = {},
    generic_sorter       = require "telescope.sorters".get_generic_fuzzy_sorter,
    shorten_path         = true,
    winblend             = 10,
    width                = 0.75,
    preview_cutoff       = 120,
    results_height       = 1,
    results_width        = 0.8,
    color_devicons       = true,
    use_less             = true,
    set_env              = {["COLORTERM"] = "truecolor"},
    file_previewer       = require "telescope.previewers".vim_buffer_cat.new,
    grep_previewer       = require "telescope.previewers".vim_buffer_vimgrep.new,
    qflist_previewer     = require "telescope.previewers".vim_buffer_qflist.new,
    mappings             = {
      i = {
        ["<c-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
      }
    },
    extensions = {
      fzy_native = {
        override_generic_sorter = false,
        override_file_sorter = true,
      }
    }
  }
}

require('telescope').load_extension('fzy_native')
require('telescope').load_extension('project')

map_cmd("n|<leader>ff", "lua require('telescope.builtin').find_files()")
map_cmd("n|<leader>fg", "lua require('telescope.builtin').git_files()")
map_cmd("n|<leader>fo", "lua require('telescope.builtin').oldfiles()")
map_cmd("n|<leader>fb", "lua require('telescope.builtin').buffers()")
map_cmd("n|<leader>fw", "lua require('telescope.builtin').live_grep()")
map_cmd("n|<leader>fh", "lua require('telescope.builtin').help_tags()")
map_cmd("n|<leader>fr", "lua require('telescope.builtin').registers()")
map_cmd("n|<leader>fc", "lua require('telescope.builtin').current_buffer_fuzzy_find()")
map_cmd("n|<leader>fm", "lua require('telescope.builtin').marks()")
map_cmd("n|<leader>fp", "lua require'telescope'.extensions.project.project{display_type = 'full'}")
