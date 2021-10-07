local tree_cb = require("nvim-tree.config").nvim_tree_callback

var_tbl {
    nvim_tree_indent_markers = 1,
    nvim_tree_git_hl = 1,
    nvim_tree_highlight_opened_files = 1,
    nvim_tree_ignore = { ".git", ".cache", ".idea", ".DS_Store" },
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
    nvim_tree_icons = {
        default = "",
        symlink = "",
        git = {
            unstaged = font_icon.modifiy,
            staged = font_icon.add,
            unmerged = font_icon.merge,
            renamed = font_icon.renamed,
            untracked = font_icon.unknown,
            deleted = font_icon.deleted,
            ignored = font_icon.ignored,
        },
    },
}

require("nvim-tree").setup {
    ignore_ft_on_setup = { ".git", ".cache", ".idea", ".DS_Store" },
    auto_close = true,
    system_open = { cmd = "open" },
    view = {
        width = 40,
        side = "left",
        auto_resize = false,
        mappings = {
            custom_only = false,
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
