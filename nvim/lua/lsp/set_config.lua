local saga = require 'lspsaga'
saga.init_lsp_saga({
  code_action_icon = '💡'
})

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

  -- Set some keybinds conditional on server capabilities
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

    buf_set_keymap("n", "<space><c-f>", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  end
  if client.resolved_capabilities.document_range_formatting then
    buf_set_keymap("v", "<space><c-f>", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
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

return set_lsp_config
