require 'helpers.globals'
local option_wrapper   = require 'helpers.option_wrapper'
local keymap_wrapper   = require 'helpers.keymap_wrapper'
local command_wrapper  = require 'helpers.command_wrapper'
local variable_wrapper = require 'helpers.variable_wrapper'

return vim.tbl_extend("error", option_wrapper, keymap_wrapper, command_wrapper, variable_wrapper)
