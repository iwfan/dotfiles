local M = {}

local function keymaps()
    map_cmd("n|<leader>ff", "lua require'p.nvim-telescope.find_files'.find()")
    map_cmd("n|<leader>fw", "lua require'p.nvim-telescope.find_files'.grep()")
    map_cmd("n|<leader>fq", "lua require'p.nvim-telescope.lsp'.workspace_symbols()")
    map_cmd("n|<leader>fo", "Telescope oldfiles")
    map_cmd("n|<leader>fb", "Telescope buffers")
    map_cmd("n|<leader>fc", "Telescope current_buffer_fuzzy_find")
    map_cmd("n|<leader>fe", "Telescope file_browser")
    map_cmd("n|<leader>fh", "Telescope help_tags")
    map_cmd("n|<leader>fl", "Telescope loclist")
    map_cmd("n|<leader>fr", "Telescope registers")
    map_cmd("n|<leader>fm", "Telescope marks")
    map_cmd("n|<leader>fk", "Telescope keymaps")
    map_cmd("n|<leader>fgs", "Telescope git_status")
    map_cmd("n|<leader>fgS", "Telescope git_stash")
    map_cmd("n|<leader>fgb", "Telescope git_branches")
    map_cmd("n|<leader>fgc", "Telescope git_commits")
    map_cmd("n|<leader>fgC", "Telescope git_bcommits")
end

M.setup = function()
    local actions = require "telescope.actions"
    require("telescope").setup {
        defaults = {
            vimgrep_arguments = {
                "rg",
                "--hidden",
                "--color=never",
                "--no-heading",
                "--with-filename",
                "--line-number",
                "--column",
                "--smart-case",
            },
            prompt_prefix = " ❯ ",
            selection_caret = "❯ ",
            entry_prefix = "  ",
            file_sorter = require("telescope.sorters").get_fzy_sorter,
            sorting_strategy = "ascending",
            selection_strategy = "reset",
            file_ignore_patterns = {},
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
            extensions = {
                fzy_native = {
                    override_generic_sorter = true,
                    override_file_sorter = true,
                },
            },
        },
    }

    require("telescope").load_extension "fzy_native"
    keymaps()
end

return M
