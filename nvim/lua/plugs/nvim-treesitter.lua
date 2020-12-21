require 'nvim-treesitter.configs'.setup {
    ensure_installed = {'bash', 'css', 'dart', 'go', 'graphql', 'html', 'java', 'javascript', 'jsdoc', 'json', 'lua', 'python', 'regex', 'toml', 'typescript', 'query'},
    highlight = {
      enable = true,
    },
    incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "gnn",
          node_incremental = "grn",
          scope_incremental = "grc",
          node_decremental = "grm",
        },
      },
      indent = {
        enable = true
      },
      playground = {
        enable = true,
        disable = {},
        updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
        persist_queries = false -- Whether the query persists across vim sessions
      },
      query_linter = {
        enable = true,
        use_virtual_text = true,
        lint_events = {"BufWrite", "CursorHold"},
      },
  }