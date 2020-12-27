local helpers = {}

function helpers.create_autocmd(event, filetype, command)
  vim.cmd(table.concat({
        'autocmd',
        event,
        filetype,
        command
      }, ' '))
end

function helpers.create_augroup(group_name, definition)
  vim.cmd("augroup " .. group_name)
  vim.cmd("autocmd!")

  for _, def in ipairs(definition)
  do
    local event    = def[1]
    local filetype = def[2]
    local command  = def[3]
    helpers.create_autocmd(event, filetype, command)
  end

  vim.cmd("augroup END")
end


function helpers.parse_from_definition_table(definitions)
  for group_name, definition in pairs(definitions)
  do
    helpers.create_augroup(group_name, definition)
  end
end

return helpers
