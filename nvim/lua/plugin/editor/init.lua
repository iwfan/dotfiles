local editor = {}
local insert = _G.insert(editor)

insert({
    "nvim-telescope/telescope.nvim",
    requires = {
        { "nvim-lua/popup.nvim" },
        { "nvim-lua/plenary.nvim" },
        { "nvim-telescope/telescope-fzy-native.nvim", run = "make" },
    },
    config = function()
        require("plugin.editor.telescope")
    end,
})

insert({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function()
        require("plugin.editor.treesitter")
    end,
})
insert("nvim-treesitter/nvim-treesitter-textobjects")
insert("windwp/nvim-ts-autotag")
insert({
    "terrortylor/nvim-comment",
    config = function()
        require("plugin.editor.comment")
    end,
})
insert("JoosepAlviste/nvim-ts-context-commentstring")

insert({
    "sindrets/diffview.nvim",
    cmd = {
        "DiffviewOpen",
        "DiffviewClose",
        "DiffviewToggleFiles",
        "DiffviewFocusFiles",
        "DiffviewRefresh",
    },
    config = function()
        require("plugin.editor.diffview")
    end,
})

insert({
    "mg979/vim-visual-multi",
    config = function()
        var_tbl({
            VM_default_mappings = 0,
            VM_maps = {
                ["Add Cursor Down"] = "<A-n>",
                ["Add Cursor Up"] = "<A-p>",
            },
        })
    end,
})

insert({
    "windwp/nvim-spectre",
    config = function()
        require("plugin.editor.spectre")
    end,
})

-- Lightspeed
insert({
    "ggandor/lightspeed.nvim",
    config = function()
        require("lightspeed").setup({
            jump_to_first_match = true,
            jump_on_partial_input_safety_timeout = 400,
            highlight_unique_chars = false,
            grey_out_search_area = true,
            match_only_the_start_of_same_char_seqs = true,
            limit_ft_matches = 5,
            full_inclusive_prefix_key = "<c-x>",
        })
    end,
})

insert({
    "blackCauldron7/surround.nvim",
    config = function()
        vim.g.surround_mappings_style = "surround"
        require("surround").setup({})
    end,
})

insert({
    "mhartington/formatter.nvim",
    config = function()
        require("plugin.editor.formatter")
    end,
})

return editor
