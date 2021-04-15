local lspinstall = require "lspinstall"
local servers = require "lspinstall/servers"

local M = {}

local function install_path(lang)
  return vim.fn.stdpath("data") .. "/lspinstall/" .. lang
end

function M.get_installed_server_config(lang)
  if lspinstall.is_server_installed(lang) then
    local config =
      vim.tbl_deep_extend(
      "keep",
      servers[lang],
      {
        default_config = {
          cmd_cwd = install_path(lang)
        }
      }
    )
    local executable = config.default_config.cmd[1]
    if vim.regex([[^[.]\{1,2}\/]]):match_str(executable) then -- matches ./ and ../
      -- prepend the install path if the executable is a relative path
      -- we need this because for the executable cmd[1] itself, cwd is not considered!
      config.default_config.cmd[1] = install_path(lang) .. "/" .. executable
    end
    return config.default_config
  else
    return {}
  end
end

return M
