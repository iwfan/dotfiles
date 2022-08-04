--
--       ▄▄        ▄▄
--     ▄████       ███▄                                            ▄▄
--   ▄ ▀█████▄     █████                                           ▀▀
--   ▌ ▀▄██████    █████     ▌ ▄▀▀▄▄   ▄▄▀▀ ▄    ▄ ▀▀▄▄ ▓█▄    ▄█▌▐██ ▐██▄███▄▄▓███▄
--   ▌    ▀█████▄  █████     ▌     ▐  ▓      █ ▄▀     ▐▌ ██▄  ▄█▌ ▐██ ▐██   ▐██   ▓██
--   ▌   ▐  ██████ █████     ▌     ▐▌ █▀▀▀▀▀▀▀ █       █  ██ ▐██  ▐██ ▐██   ▐██   ▐██
--   ▌   ▐   ▀█████▄████     ▌     ▐▌ █        ▀▄      █   ████   ▐██ ▐██   ▐██   ▐██
--   ▌   ▐    ▀█████▄▀██     ▌     ▐   ▀▀▄▄▄▀▀   ▀▄▄▄▀▀    ▐▀▀    ▐▀▀ ▐▀▀   ▐▀▀   ▐▀▀
--   ▀   ▐      ▀█████ █
--     ▀▄▐       ▀████
--       ▀         ▀
--
-- Author:   Zi莱卷 <i.wangfancn@gmail.com>
-- Github:   https://github.com/iwfan/dotfiles

local lua_runtime_path = vim.fn.stdpath "config" .. "/lua"
local user_config_path = lua_runtime_path .. "/f"

if vim.fn.empty(vim.fn.glob(user_config_path)) > 0 then
    vim.notify("user config path is empty", vim.log.levels.ERROR)
    return
end

local config_modules_paths = vim.fn.split(vim.fn.globpath(user_config_path, "*.lua"), "\n")

local function path_transformer(path)
    return path:gsub("^" .. lua_runtime_path .. "/", ""):match "(.+)%..+$"
end

local modules = vim.tbl_map(path_transformer, config_modules_paths)

table.sort(modules)

for _, module in pairs(modules) do
    local ok = pcall(require, module)
    if not ok then
        vim.notify("Can not require module: " .. module, vim.log.levels.WARN)
    end
end
