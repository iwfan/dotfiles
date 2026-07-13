-- ============================================================================
-- pack.lua — Unified plugin declarations
--
-- All vim.pack.add calls live here. Lazy-loading groups are wrapped in autocmds.
-- Plugin configuration stays in plugin/<name>.lua.
-- ============================================================================

vim.pack.add {
  -- ===== Base / UI (always loaded) =====
  {
    src = "https://github.com/nvim-lua/plenary.nvim",
    version = "master",
  },
  {
    src = "https://github.com/sainnhe/everforest",
    version = "master",
  },
  {
    src = "https://github.com/nvim-mini/mini.icons",
    version = "main",
  },

  -- ===== Completion / Snippets =====
  {
    src = "https://github.com/nvim-mini/mini.completion",
    version = "main",
  },
  {
    src = "https://github.com/nvim-mini/mini.snippets",
    version = "main",
  },
  {
    src = "https://github.com/rafamadriz/friendly-snippets",
  },

  -- ===== Treesitter / LSP / Lint / Format =====
  {
    src = "https://github.com/nvim-treesitter/nvim-treesitter",
    version = "main",
  },
  {
    src = "https://github.com/neovim/nvim-lspconfig",
    version = "master",
  },
  {
    src = "https://github.com/mason-org/mason.nvim",
  },
  {
    src = "https://github.com/folke/lazydev.nvim",
  },
  {
    src = "https://github.com/mfussenegger/nvim-lint",
  },
  {
    src = "https://github.com/stevearc/conform.nvim",
  },

  -- ===== Multi-cursor =====
  {
    src = "https://github.com/mg979/vim-visual-multi",
    version = "master",
  },

  -- ===== Fuzzy Finder =====
  {
    src = "https://github.com/dmtrKovalenko/fff.nvim",
    version = "main",
  },

  -- ===== WhichKey =====
  {
    src = "https://github.com/folke/which-key.nvim",
    version = "main",
  },
}

-- ============================================================================
-- Lazy on first BufReadPost — editing helpers & git
-- ============================================================================
vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
  once = true,
  callback = function()
    vim.pack.add {
      -- Mini editing plugins
      {
        src = "https://github.com/nvim-mini/mini.bufremove",
        version = "main",
      },
      {
        src = "https://github.com/nvim-mini/mini.comment",
        version = "main",
      },
      {
        src = "https://github.com/JoosepAlviste/nvim-ts-context-commentstring",
        version = "main",
      },
      {
        src = "https://github.com/nvim-mini/mini.pairs",
        version = "main",
      },
      {
        src = "https://github.com/nvim-mini/mini.surround",
        version = "main",
      },
      {
        src = "https://github.com/nvim-mini/mini.hipatterns",
        version = "main",
      },
      {
        src = "https://github.com/nvim-mini/mini.indentscope",
        version = "main",
      },

      -- Git
      {
        src = "https://github.com/lewis6991/gitsigns.nvim",
      },
      {
        src = "https://github.com/sindrets/diffview.nvim",
      },
      {
        src = "https://github.com/NeogitOrg/neogit",
      },
    }
  end,
})

-- ============================================================================
-- Lazy on VimEnter — statusline (UI polish, non-blocking)
-- ============================================================================
vim.api.nvim_create_autocmd("VimEnter", {
  once = true,
  callback = function()
    vim.pack.add {
      {
        src = "https://github.com/nvim-lualine/lualine.nvim",
      },
      {
        src = "https://github.com/rmagatti/auto-session",
      },
    }
  end,
})

-- ============================================================================
-- Lazy on FileType markdown — render-markdown (only when editing .md files)
-- ============================================================================
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  once = true,
  callback = function()
    vim.pack.add {
      {
        src = "https://github.com/MeanderingProgrammer/render-markdown.nvim",
      },
    }
  end,
})
