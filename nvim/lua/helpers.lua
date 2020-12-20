local helpers = {}

function helpers.table_merge(...)
  local merged_table = {}
  for index, table in ipairs{...} do
    if type(table) == "table" then
      for key, value in pairs(table) do
        merged_table[key] = value
      end
    end
  end
  return merged_table
end

-- https://github.com/nanotee/nvim-lua-guide#using-meta-accessors
function helpers.bind_option(key, value)
  if pcall(vim.api.nvim_get_option, key) then
    vim.o[key] = value
  elseif pcall(vim.api.nvim_buf_get_option, 0, key) then
    vim.bo[key] = value
  else
    vim.wo[key] = value
  end
end

return helpers
