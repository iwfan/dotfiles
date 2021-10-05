local appearance = {}
local insert = _G.insert(appearance)

insert({
    "kyazdani42/nvim-web-devicons",
    config = function()
        require("plugin.appearance.web-devicons")
    end,
})

insert({
    "kyazdani42/nvim-tree.lua",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
        require("plugin.appearance.nvim-tree")
    end,
})

insert({
    "Akin909/nvim-bufferline.lua",
    requires = "famiu/bufdelete.nvim",
    config = function()
        require("plugin.appearance.nvim-bufferline")
    end,
})

insert({
    "famiu/feline.nvim",
    config = function()
        require("plugin.appearance.feline")
    end,
})

insert({
    "glepnir/dashboard-nvim",
    config = function()
        require("plugin.appearance.nvim-dashboard")
    end,
})

insert({
    "sainnhe/gruvbox-material",
    config = function()
        var_tbl({
            gruvbox_material_enable_italic = 1,
            gruvbox_material_diagnostic_text_highlight = 1,
            gruvbox_material_sign_column_background = "none",
        })
        vim.opt.background = "dark"
        vim.cmd("color gruvbox-material")
    end,
})

insert({
    "lukas-reineke/indent-blankline.nvim",
    event = "BufRead",
    config = function()
        require("plugin.appearance.indent-blankline")
    end,
})

insert({
    "norcalli/nvim-colorizer.lua",
    config = function()
        require("colorizer").setup()
    end,
})

return appearance
