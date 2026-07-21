return {
  -- ===== Base / UI (always loaded) =====
  { "nvim-lua/plenary.nvim", branch = "master", lazy = false },
  { "sainnhe/everforest", branch = "master", lazy = false, priority = 1000 },
  { "nvim-mini/mini.icons", branch = "main", lazy = false },

  -- ===== Completion / Snippets =====
  { "nvim-mini/mini.completion", branch = "main", lazy = false },
  { "nvim-mini/mini.snippets", branch = "main", lazy = false },
  { "rafamadriz/friendly-snippets", lazy = false },

  -- ===== Treesitter / LSP / Lint / Format =====
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    lazy = false,
  },
  { "neovim/nvim-lspconfig", branch = "master", lazy = false },
  {
    "mason-org/mason.nvim",
    lazy = false,
  },
  { "folke/lazydev.nvim", lazy = false },
  { "mfussenegger/nvim-lint", lazy = false },
  { "stevearc/conform.nvim", lazy = false },

  -- ===== Multi-cursor =====
  { "mg979/vim-visual-multi", branch = "master", lazy = false },

  -- ===== Fuzzy Finder =====
  {
    "dmtrKovalenko/fff.nvim",
    branch = "main",
    lazy = false,
    build = function()
      require("fff.download").download_or_build_binary()
    end,
  },

  -- ===== WhichKey =====
  { "folke/which-key.nvim", branch = "main", lazy = false },

  -- ===== Editing helpers (VeryLazy) =====
  { "nvim-mini/mini.bufremove", branch = "main", event = "VeryLazy" },
  { "nvim-mini/mini.comment", branch = "main", event = "VeryLazy" },
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    branch = "main",
    event = "VeryLazy",
  },
  { "nvim-mini/mini.pairs", branch = "main", event = "VeryLazy" },
  { "nvim-mini/mini.surround", branch = "main", event = "VeryLazy" },
  { "nvim-mini/mini.hipatterns", branch = "main", event = "VeryLazy" },
  { "nvim-mini/mini.indentscope", branch = "main", event = "VeryLazy" },

  -- ===== Git (VeryLazy) =====
  { "lewis6991/gitsigns.nvim", event = "VeryLazy" },
  { "sindrets/diffview.nvim", event = "VeryLazy" },
  { "NeogitOrg/neogit", event = "VeryLazy" },

  -- ===== UI (VimEnter) =====
  { "nvim-lualine/lualine.nvim", event = "VimEnter" },
  { "rmagatti/auto-session", event = "VimEnter" },

  -- ===== Markdown (ft) =====
  { "MeanderingProgrammer/render-markdown.nvim", ft = "markdown" },
}
