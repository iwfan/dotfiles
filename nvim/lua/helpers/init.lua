require 'helpers.globals'
local option_wrapper = require 'helpers.option_wrapper'
local keymap_wrapper = require 'helpers.keymap_wrapper'
local command_wrapper = require 'helpers.command_wrapper'

local M = {}

function M.table_merge(...)
  local merged_table = {}
  for __, table in ipairs{...} do
    if type(table) == "table" then
      for key, value in pairs(table) do
        merged_table[key] = value
      end
    end
  end
  return merged_table
end

return M.table_merge(M, option_wrapper, keymap_wrapper, command_wrapper)
