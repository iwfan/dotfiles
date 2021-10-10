local M = {}

local function keymaps()
    map_cmd("n|<C-p>f", "lua require'p.nvim-telescope.find_files'.find()")
    map_cmd("n|<C-p>w", "lua require'p.nvim-telescope.find_files'.grep()")
    map_cmd("n|<C-p>q", "lua require'p.nvim-telescope.lsp'.workspace_symbols()")
    map_cmd("n|<C-p>o", "Telescope oldfiles")
    map_cmd("n|<C-p>b", "Telescope buffers")
    map_cmd("n|<C-p>c", "Telescope current_buffer_fuzzy_find")
    map_cmd("n|<C-p>e", "Telescope file_browser")
    map_cmd("n|<C-p>h", "Telescope help_tags")
    map_cmd("n|<C-p>l", "Telescope loclist")
    map_cmd("n|<C-p>r", "Telescope registers")
    map_cmd("n|<C-p>m", "Telescope marks")
    map_cmd("n|<C-p>k", "Telescope keymaps")
    map_cmd("n|<C-p>gs", "Telescope git_status")
    map_cmd("n|<C-p>gS", "Telescope git_stash")
    map_cmd("n|<C-p>gb", "Telescope git_branches")
    map_cmd("n|<C-p>gc", "Telescope git_commits")
    map_cmd("n|<C-p>gC", "Telescope git_bcommits")
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
