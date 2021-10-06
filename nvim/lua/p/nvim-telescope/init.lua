local M = {}

local function keymaps()
    map_cmd("n|<C-f>f", "lua require'p.nvim-telescope.find_files'.find()")
    map_cmd("n|<C-f>w", "lua require'p.nvim-telescope.find_files'.grep()")
    map_cmd("n|<C-f>q", "lua require'p.nvim-telescope.lsp'.workspace_symbols()")
    map_cmd("n|<C-f>s", "Telescope git_status")
    map_cmd("n|<C-f>o", "Telescope oldfiles")
    map_cmd("n|<C-f>b", "Telescope buffers")
    map_cmd("n|<C-f>c", "Telescope current_buffer_fuzzy_find")
    map_cmd("n|<C-f>e", "Telescope file_browser")
    map_cmd("n|<C-f>h", "Telescope help_tags")
    map_cmd("n|<C-f>l", "Telescope loclist")
    map_cmd("n|<C-f>r", "Telescope registers")
    map_cmd("n|<C-f>m", "Telescope marks")
    map_cmd("n|<C-f>k", "Telescope keymaps")
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
