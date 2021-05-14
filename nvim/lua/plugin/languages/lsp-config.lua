vim.fn.sign_define("LspDiagnosticsSignError", {
  texthl = "LspDiagnosticsSignError";
  numhl = "LspDiagnosticsSignError";
  text = emoji_icon.error;
})

vim.fn.sign_define("LspDiagnosticsSignWarning", {
  texthl = "LspDiagnosticsSignWarning";
  numhl = "LspDiagnosticsSignWarning";
  text = emoji_icon.warn;
})

vim.fn.sign_define("LspDiagnosticsSignHint", {
  texthl = "LspDiagnosticsSignHint";
  numhl = "LspDiagnosticsSignHint";
  text = emoji_icon.hint;
})

vim.fn.sign_define("LspDiagnosticsSignInformation", {
  texthl = "LspDiagnosticsSignInformation";
  numhl = "LspDiagnosticsSignInformation";
  text = emoji_icon.info;
})

local on_attach = function(client, bufnr)
  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end
  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

  local map_cmd = _G.buf_map_cmd(bufnr)

  map_cmd("n|]d",          "Lspsaga diagnostic_jump_next")
  map_cmd("n|[d",          "Lspsaga diagnostic_jump_prev")
  map_cmd("n|\\d",         "Lspsaga show_line_diagnostics")
  map_cmd("n|K",           "Lspsaga hover_doc")
  map_cmd("n|<space>fl",   "Lspsaga lsp_finder")
  map_cmd("n|<space><cr>", "Lspsaga code_action")
  map_cmd("v|<space><cr>", "Lspsaga range_code_action")
  map_cmd("n|gd",          "lua vim.lsp.buf.definition()")
  map_cmd("n|gD",          "lua vim.lsp.buf.declaration()")
  map_cmd("n|gi",          "lua vim.lsp.buf.implementation()")
  map_cmd("n|gr",          "lua vim.lsp.buf.references()")
  map_cmd("n|<space>K",    "Lspsaga signature_help")
  map_cmd("n|<space>rn",   "Lspsaga rename")
  map_cmd("n|gh",          "Lspsaga lsp_finder")
  map_cmd("n|D",           "lua vim.lsp.buf.type_definition()")
  map_cmd("n|<Leader>cw",  "lua vim.lsp.buf.workspace_symbol()")
  map_cmd("n|<C-f>",       "lua require('lspsaga.action').smart_scroll_with_saga(1)", { nowait = true })
  map_cmd("n|<C-b>",       "lua require('lspsaga.action').smart_scroll_with_saga(-1)", { nowait = true })
  map_cmd('n|<space>q',    'TroubleToggle')

  if client.resolved_capabilities.document_formatting then
    -- vim.api.nvim_exec(
    --   [[
    --   augroup lsp_document_formatter
    --     autocmd! * <buffer>
    --     autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting()
    --   augroup END
    --   ]],
    --   false
    -- )
    map_cmd("n|<space>fm", "lua vim.lsp.buf.formatting()")
  end

  if client.resolved_capabilities.document_range_formatting then
    map_cmd("v|<space>fm", "lua vim.lsp.buf.range_formatting()")
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

local lspconf = require("lspconfig")

-- these langs require same lspconfig so put em all in a table and loop through!
local servers = {"html", "cssls", "tsserver", "bashls", "dockerls", "vuels", "yamlls", "jsonls"}

for _, lang in ipairs(servers) do
    lspconf[lang].setup {
      on_attach = on_attach,
    }
end

-- vls conf example
local vls_binary = "/usr/local/bin/vls"
lspconf.vls.setup {
    cmd = {vls_binary}
}

local sumneko_root_path = stdpath .. "/lsp_install/lua-language-server"
local sumneko_binary = stdpath .. "/lsp_install/lua-language-server/bin/Linux/lua-language-server"

lspconf.sumneko_lua.setup {
    cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
    root_dir = function()
        return vim.loop.cwd()
    end,
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
                path = vim.split(package.path, ";")
            },
            diagnostics = {
                globals = {"vim"}
            },
            workspace = {
                library = {
                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                    [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true
                }
            },
            telemetry = {
                enable = false
            }
        }
    }
}



