vim.api.nvim_command("set foldmethod=expr")
vim.api.nvim_command("set foldexpr=nvim_treesitter#foldexpr()")

require "nvim-treesitter.configs".setup {
  ensure_installed = {
    "bash",
    "c",
    "comment",
    "cpp",
    "css",
    "dart",
    "dockerfile",
    "erlang",
    "go",
    "gomod",
    "graphql",
    "html",
    "java",
    "javascript",
    "jsdoc",
    "json",
    "jsonc",
    "latex",
    "lua",
    "python",
    "query",
    "regex",
    "regex",
    "ruby",
    "rust",
    "toml",
    "tsx",
    "typescript",
    "vue",
    "yaml"
  },
  highlight = {
    enable = true,
    use_languagetree = true,
    additional_vim_regex_highlighting = true
  },
  indent = {
    enable = true
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<Enter>",
      node_incremental = "<Enter>",
      scope_incremental = "grc",
      node_decremental = "<BS>"
    }
  },
  textobjects = {
    select = {
      enable = true,
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner"
      }
    },
    swap = {
      enable = true,
      swap_next = {
        ["<leader>a"] = "@parameter.inner",
      },
      swap_previous = {
        ["<leader>A"] = "@parameter.inner",
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        ["]m"] = "@function.outer",
        ["]]"] = "@class.outer",
      },
      goto_next_end = {
        ["]M"] = "@function.outer",
        ["]["] = "@class.outer",
      },
      goto_previous_start = {
        ["[m"] = "@function.outer",
        ["[["] = "@class.outer",
      },
      goto_previous_end = {
        ["[M"] = "@function.outer",
        ["[]"] = "@class.outer",
      },
    },
    lsp_interop = {
      enable = true,
      peek_definition_code = {
        ["gdf"] = "@function.outer",
        ["gdF"] = "@class.outer",
      },
    },
  },
  autotag = {
    enable = true
  },
  context_commentstring = {
    enable = true
  },
  matchup = {
    enable = true,              -- mandatory, false will disable the whole extension
    disable = { "c", "ruby" },  -- optional, list of language that will be disabled
  }
}
