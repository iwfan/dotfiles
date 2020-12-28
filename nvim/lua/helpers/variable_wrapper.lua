local helpers = {}

function helpers.set_var(name, value)
  vim.api.nvim_set_var(name, value)
end

function helpers.parse_variable_from_table(variable_table)
  for variable_name, value in pairs(variable_table)
  do
    helpers.set_var(variable_name, value)
  end
end

return helpers
