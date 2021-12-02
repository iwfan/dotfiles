require("indent_blankline").setup {
    char = "▏",
    use_treesitter = true,
    filetype_exclude = {
        "help",
        "terminal",
        "dashboard",
        "packer",
        "lspinfo",
        "TelescopePrompt",
        "TelescopeResults",
        "startify",
        "dashboard",
        "log",
        "fugitive",
        "gitcommit",
        "vimwiki",
        "markdown",
        "txt",
        "todoist",
        "NvimTree",
        "CHADTree",
        "peekaboo",
        "git",
        "", -- for all buffers without a file type
    },
    buftype_exclude = { "terminal", "telescope" },
    show_trailing_blankline_indent = false,
    show_first_indent_level = false,
}
