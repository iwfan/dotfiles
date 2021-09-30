local tree_cb = require("nvim-tree.config").nvim_tree_callback

var_tbl({
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
})

require("nvim-tree").setup({
    ignore_ft_on_setup = { ".git", ".cache", ".idea", ".DS_Store" },
    auto_close = true,
    system_open = {
        -- the command to run this, leaving nil should work in most cases
        cmd = "open",
        -- the command arguments as a list
        args = {},
    },
    view = {
        -- width of the window, can be either a number (columns) or a string in `%`
        width = 40,
        -- side of the tree, can be one of 'left' | 'right' | 'top' | 'bottom'
        side = "left",
        -- if true the tree will resize itself after opening a file
        auto_resize = false,
        mappings = {
            -- custom only false will merge the list with the default mappings
            -- if true, it will only use your list to set the mappings
            custom_only = false,
            -- list of mappings to set on the tree manually
            list = {
                { key = { "<CR>", "<2-LeftMouse>" }, cb = tree_cb("edit") },
                { key = "o", cb = tree_cb("system_open") },
                { key = "l", cb = tree_cb("edit") },
                { key = "h", cb = tree_cb("close_node") },
                { key = "<C-e>", cb = tree_cb("close") },
            },
        },
    },
})

autocmd("BufEnter", "NvimTree", "exec 'NvimTreeRefresh'")

map_cmd("n|<C-e>", "NvimTreeToggle")
map_cmd("n|<C-E>", "NvimTreeFindFile")
