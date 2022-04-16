local CursorLineControlGroup = vim.api.nvim_create_augroup("CursorLineControl", { clear = true })
local set_cursorline = function(event, value, pattern)
  vim.api.nvim_create_autocmd(event, {
    group = CursorLineControlGroup,
    pattern = pattern,
    callback = function()
      vim.opt_local.cursorline = value
    end,
  })
end
set_cursorline("WinLeave", false)
set_cursorline("WinEnter", true)
set_cursorline("FileType", false, "TelescopePrompt")

local LuaHighlightGroup = vim.api.nvim_create_augroup("LuaHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
    group = LuaHighlightGroup,
    callback = function()
        vim.highlight.on_yank { higroup="IncSearch", timeout=300, on_macro = true }
    end,
})

local MiscGroup = vim.api.nvim_create_augroup("Misc", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
    group = MiscGroup,
    callback = function()
        vim.cmd [[%s/\s\+$//e]]
        vim.cmd [[%s/\n\+\%$//e]]
    end,
})
