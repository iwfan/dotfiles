--make life easier
_G.g = vim.g
_G.fn = vim.fn
_G.exec = vim.api.nvim_exec
_G.cmd = vim.api.nvim_command
_G.var = vim.api.nvim_set_var
_G.tbl_extend = vim.tbl_extend

--set vim option
function _G.opt(key, value)
  if pcall(vim.api.nvim_get_option, key) then
    vim.o[key] = value
  elseif pcall(vim.api.nvim_buf_get_option, 0, key) then
    vim.bo[key] = value
  else
    vim.wo[key] = value
  end
end

--variable
function _G.var_tbl(variable_table)
  for variable_name, value in pairs(variable_table)
  do
    var(variable_name, value)
  end
end

--mappings
function _G.map(mode_and_lhs, rhs, opts)
  local options = {
    noremap = true,
    silent = true;
    expr = false;
    nowait = false;
  }
  if opts then
    options = tbl_extend('force', options, opts)
  end
  local mode, lhs = mode_and_lhs:match("([^|]*)|?(.*)")
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

function _G.map_cmd(mode_and_lhs, rhs, opts)
  map(mode_and_lhs, string.format("<cmd>%s<CR>", rhs), opts)
end

--inspect stuff
function _G.dump(...)
  local objects = vim.tbl_map(vim.inspect, { ... })
  print(' === ')
  print(unpack(objects))
  print(' === ')
end
