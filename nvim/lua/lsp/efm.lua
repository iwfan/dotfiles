local nvim_lsp = require("lspconfig")
local set_lsp_config = require("lsp/set_config")
local js_utils = require("js_utils")

local eslint = {
  lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}",
  lintStdin = true,
  lintFormats = {"%f:%l:%c: %m"},
  lintIgnoreExitCode = true,
  formatCommand = js_utils.get_js_formatter(),
  formatStdin = true
}

local prettier = {
  formatCommand = "prettier --stdin-filepath ${INPUT}",
  formatStdin = true
}

nvim_lsp.efm.setup {
  on_attach = function(client, bufnr)
    client.resolved_capabilities.document_formatting = true
    set_lsp_config(client, bufnr)
  end,
  init_options = {documentFormatting = true},
  default_config = {
    cmd = {
      "efm-langserver",
      "-c",
      [["$HOME/.config/efm-langserver/config.yaml"]]
    }
  },
  -- root_dir = function()
  --   local js_utils = require "js_utils"
  --   if js_utils.eslint_config_exists() or js_utils.prettier_config_exists() then
  --     return vim.fn.getcwd()
  --   end
  -- end,
  settings = {
    rootMarkers = {".git/"},
    languages = {
      javascript = {eslint},
      javascriptreact = {eslint},
      ["javascript.jsx"] = {eslint},
      typescript = {eslint},
      ["typescript.tsx"] = {eslint},
      typescriptreact = {eslint},
      lua = {
        {formatCommand = "luafmt --indent-count 2 --stdin", formatStdin = true}
      },
      html = {prettier},
      css = {prettier},
      json = {prettier}
    }
  },
  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescript.tsx",
    "typescriptreact",
    "lua",
    "html",
    "css",
    "sass",
    "scss",
    "less",
    "json",
    "yaml"
  },
  commands = {
    EfmLog = {
      function()
        vim.api.nvim_command("vsplit /tmp/efm.log")
      end
    },
    LspLog = {
      function()
        vim.api.nvim_command("vsplit" .. vim.lsp.get_log_path())
      end
    }
  }
}
