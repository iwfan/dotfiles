local tree_cb = require("nvim-tree.config").nvim_tree_callback
var_tbl({
    nvim_tree_width = 40,
    nvim_tree_indent_markers = 1,
    nvim_tree_follow = 0,
    nvim_tree_quit_on_open = 1,
    nvim_tree_git_hl = 1,
    nvim_tree_width_allow_resize = 1,
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
    nvim_tree_bindings = {
        { key = "l", cb = tree_cb("edit") },
        { key = "h", cb = tree_cb("close_node") },
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
        folder = {
            default = "",
            open = "",
            empty = "",
            empty_open = "",
            symlink = "",
            symlink_open = "",
        },
    },
})

map_cmd("n|<leader>1", "NvimTreeToggle")
map_cmd("n|<leader>e", "NvimTreeToggle")
map_cmd("n|<leader>E", "NvimTreeFindFile")
