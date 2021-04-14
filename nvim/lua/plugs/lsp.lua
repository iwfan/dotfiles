local nvim_lsp = require("lspconfig")

vim.fn.sign_define(
  "LspDiagnosticsSignError",
  {texthl = "LspDiagnosticsSignError", text = "", numhl = "LspDiagnosticsSignError"}
)
vim.fn.sign_define(
  "LspDiagnosticsSignWarning",
  {texthl = "LspDiagnosticsSignWarning", text = "", numhl = "LspDiagnosticsSignWarning"}
)
vim.fn.sign_define(
  "LspDiagnosticsSignHint",
  {texthl = "LspDiagnosticsSignHint", text = "", numhl = "LspDiagnosticsSignHint"}
)
vim.fn.sign_define(
  "LspDiagnosticsSignInformation",
  {texthl = "LspDiagnosticsSignInformation", text = "", numhl = "LspDiagnosticsSignInformation"}
)

local set_lsp_config = function(client, bufnr)
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end
  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Mappings.
  local opts = {noremap = true, silent = true}
  buf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
  buf_set_keymap("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
  buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  buf_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  buf_set_keymap("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
  buf_set_keymap("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
  buf_set_keymap("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
  buf_set_keymap("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
  buf_set_keymap("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  buf_set_keymap("n", "<space>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
  buf_set_keymap("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
  buf_set_keymap("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
  buf_set_keymap("n", "<space>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)

  buf_set_keymap("n", "]r", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
  buf_set_keymap("n", "[r", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    buf_set_keymap("n", "<space>p", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  end
  if client.resolved_capabilities.document_range_formatting then
    buf_set_keymap("v", "<space>p", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
  end

  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec(
      [[
      hi LspReferenceRead cterm=bold ctermbg=red guibg=#353644
      hi LspReferenceText cterm=bold ctermbg=red guibg=#353644
      hi LspReferenceWrite cterm=bold ctermbg=red guibg=#353644
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]],
      false
    )
  end
end

local servers = {"rust_analyzer", "pyright", "bashls"}
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {on_attach = set_lsp_config}
end

local ts_servers = {"tsserver", "denols"}
for _, lsp in ipairs(ts_servers) do
  nvim_lsp[lsp].setup {
    on_attach = function(client, bufnr)
      if client.config.flags then
        client.config.flags.allow_incremental_sync = true
      end
      client.resolved_capabilities.document_formatting = false
      set_lsp_config(client, bufnr)
    end
  }
end

nvim_lsp.sumneko_lua.setup(
  {
    cmd = {
      vim.fn.stdpath("data") .. "/lspinstall/lua/sumneko-lua-language-server"
    },
    settings = {
      Lua = {
        diagnostics = {
          enable = true,
          globals = {
            "vim",
            "packer_plugins",
            "use",
            "describe",
            "it",
            "assert",
            "before_each",
            "after_each"
          }
        },
        runtime = {version = "LuaJIT"},
        workspace = {
          library = vim.list_extend({[vim.fn.expand("$VIMRUNTIME/lua")] = true}, {})
        }
      }
    },
    on_attach = set_lsp_config
  }
)

local eslint = {
  lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}",
  lintStdin = true,
  lintFormats = {"%f:%l:%c: %m"},
  lintIgnoreExitCode = true,
  formatCommand = "eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}",
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
  root_dir = function()
    local js_utils = require "js_utils"
    if js_utils.eslint_config_exists() or js_utils.prettier_config_exists() then
      return vim.fn.getcwd()
    end
  end,
  settings = {
    languages = {
      javascript = {eslint},
      javascriptreact = {eslint},
      ["javascript.jsx"] = {eslint},
      typescript = {eslint},
      ["typescript.tsx"] = {eslint},
      typescriptreact = {eslint}
    }
  },
  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescript.tsx",
    "typescriptreact"
  },
  commands = {
    EfmLog = {
      function()
        vim.api.nvim_command("split $HOME/efmlangserver.log")
      end
    }
  }
}
