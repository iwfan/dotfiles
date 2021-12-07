local M = {}

M.set_val = function()
    var_tbl {
        nvim_tree_indent_markers = 1,
        nvim_tree_git_hl = 1,
        nvim_tree_highlight_opened_files = 1,
        nvim_tree_special_files = { "README.md", "Makefile", "MAKEFILE" },
        nvim_tree_window_picker_exclude = {
            filetype = {
                "packer",
                "qf",
            },
            buftype = {
                "terminal",
                "help",
            },
        },
        nvim_tree_show_icons = {
            git = 0,
            folders = 1,
            files = 1,
            folder_arrows = 1,
        },
        nvim_tree_icons = {
            default = "",
            symlink = "",
        },
    }
end

M.setup = function()
    local tree_cb = require("nvim-tree.config").nvim_tree_callback

    require("nvim-tree").setup {
        ignore_ft_on_setup = { ".git", ".cache", ".idea", ".DS_Store" },
        auto_close = true,
        system_open = { cmd = "open" },
        filters = {
            custom = { ".git", ".idea" },
        },
        view = {
            width = 40,
            mappings = {
                list = {
                    { key = { "<CR>", "<2-LeftMouse>" }, cb = tree_cb "edit" },
                    { key = "o", cb = tree_cb "system_open" },
                    { key = "l", cb = tree_cb "edit" },
                    { key = "h", cb = tree_cb "close_node" },
                    { key = "<C-e>", cb = tree_cb "close" },
                },
            },
        },
    }

    map_cmd("n|<leader>e", "NvimTreeToggle")
    map_cmd("n|<C-E>", "NvimTreeFindFile")
    autocmd("BufEnter", "NvimTree", "NvimTreeRefresh")
end

return M
