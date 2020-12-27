local helpers = {}
local rhs_config = {}

function rhs_config:new(rhs)
  local instance = {
    mode    = '';
    lhs     = '';
    rhs     = rhs;
    options = {
      noremap = false;
      silent  = false;
      expr    = false;
    }
  }
  setmetatable(instance, self)
  self.__index = self
  return instance
end

function rhs_config:with_noremap()
  self.options.noremap = true
  return self
end

function rhs_config:with_silent()
  self.options.silent = true
  return self
end

function rhs_config:with_expr()
  self.options.expr = true
  return self
end

function helpers.map_cmd(rhs)
 return rhs_config:new(rhs)
end

function helpers.map_cr(rhs)
  return rhs_config:new((":%s<CR>"):format(rhs))
end

function helpers.map_cu(rhs)
  return rhs_config:new((":<C-u>%s<CR>"):format(rhs))
end

function helpers.map_arg(rhs)
  return rhs_config:new((":%s<SPACE>"):format(rhs))
end

function helpers.bind_key(mode_and_lhs, rhs_info)
  local mode, lhs = mode_and_lhs:match("([^|]*)|?(.*)")
  vim.api.nvim_set_keymap(mode, lhs, rhs_info.rhs, rhs_info.options)
end

return helpers
