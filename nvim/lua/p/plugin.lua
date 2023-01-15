local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "--single-branch",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  }
end
vim.opt.runtimepath:prepend(lazypath)

require("lazy").setup {
  "gpanders/editorconfig.nvim",
  {
    "glepnir/dashboard-nvim",
    config = function()
      require "p.nvim-startup"
    end,
  },
  {
    "glepnir/galaxyline.nvim",
    branch = "main",
    event = "BufRead",
    dependencies = { "kyazdani42/nvim-web-devicons" },
    config = function()
      require "p.nvim-statusline"
    end,
  },
  {
    "akinsho/bufferline.nvim",
    version = "*",
    event = "BufRead",
    dependencies = { "kyazdani42/nvim-web-devicons", "famiu/bufdelete.nvim" },
    config = function()
      require "p.nvim-bufferline"
    end,
  },
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require "p.nvim-toggleterm"
    end,
  },
  {
    "sainnhe/gruvbox-material",
    config = function()
      vim.g.gruvbox_material_background = "hard"
      vim.g.gruvbox_material_enable_italic = 1
      vim.g.gruvbox_material_sign_column_background = "none"
      vim.g.gruvbox_material_better_performance = 1
      vim.g.gruvbox_material_transparent_background = 0
      vim.g.gruvbox_material_diagnostic_virtual_text = "colored"
      vim.cmd.colorscheme "gruvbox-material"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    build = function()
      pcall(require("nvim-treesitter.install").update { with_sync = true })
    end,
    config = function()
      require "p.nvim-treesitter"
    end,
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    version = "*",
    config = function()
      require "p.nvim-telescope"
    end,
    dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-ui-select.nvim" },
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "lsp.lsp_config"
    end,
    dependencies = {
      {
        "williamboman/mason.nvim",
        config = function()
          require("mason").setup()
        end,
      },
      {
        "williamboman/mason-lspconfig.nvim",
        config = function()
          require "lsp.mason-lspconfig"
        end,
      },
      {
        "j-hui/fidget.nvim",
        config = function()
          require("fidget").setup {}
        end,
      },
      "jose-elias-alvarez/typescript.nvim",
      "folke/neodev.nvim",
      "jose-elias-alvarez/null-ls.nvim",
    },
  },
  {
    "hrsh7th/nvim-cmp",
    config = function()
      require "lsp.cmp"
    end,
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
    },
  },

  { "tpope/vim-repeat" },
  { "tpope/vim-fugitive", cmd = { "Git", "G", "Gdiffsplit", "Gvdiffsplit" } },
  {
    "kylechui/nvim-surround",
    event = "BufRead",
    config = function()
      require("nvim-surround").setup()
    end,
  },
  {
    "windwp/nvim-autopairs",
    event = "BufRead",
    config = function()
      require("nvim-autopairs").setup()
    end,
  },
  { "windwp/nvim-ts-autotag", event = "BufRead" },
  {
    "numToStr/Comment.nvim",
    event = "BufRead",
    config = function()
      require "p.nvim-comment"
    end,
  },
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewFileHistory" },
    config = function()
      require("diffview").setup()
    end,
    dependencies = "nvim-lua/plenary.nvim",
  },
  {
    "lewis6991/gitsigns.nvim",
    event = "BufRead",
    config = function()
      require "p.nvim-gitsigns"
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufRead",
    config = function()
      require "p.nvim-indentline"
    end,
  },
  {
    "norcalli/nvim-colorizer.lua",
    event = "BufRead",
    config = function()
      require "p.nvim-colorizer"
    end,
  },
  {
    "kevinhwang91/nvim-hlslens",
    event = "BufRead",
  },
  { "kevinhwang91/nvim-ufo", event = "BufRead", dependencies = "kevinhwang91/promise-async" },
  {
    "mg979/vim-visual-multi",
    event = "BufRead",
  },
  {
    "ggandor/leap.nvim",
    event = "BufRead",
  },
  {
    "andymass/vim-matchup",
    event = "BufRead",
  },
  {
    "nvim-pack/nvim-spectre",
    config = function()
      require "p.nvim-spectre"
    end,
  },
}
