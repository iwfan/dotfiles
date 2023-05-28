local Terminal = require("toggleterm.terminal").Terminal

local old_laststatus = nil
local old_showtabline = nil
local old_cursorline = nil
local old_relativenumber = nil

local function show_line()
    vim.opt.laststatus = old_laststatus
    vim.opt.showtabline = old_showtabline
    vim.opt_local.cursorline = old_cursorline
    vim.opt_local.relativenumber = old_relativenumber
end

local function hide_line()
    old_laststatus = vim.opt.laststatus
    old_showtabline = vim.opt.showtabline
    old_cursorline = vim.opt_local.cursorline
    old_relativenumber = vim.opt_local.relativenumber

    vim.opt.laststatus = 0
    vim.opt.showtabline = 0
    vim.opt_local.cursorline = false
    vim.opt_local.relativenumber = false
end

function Lazygit_toggle()
    Terminal:new({
        cmd = "lazygit",
        start_in_insert = true,
        close_on_exit = true,
        direction = "tab",
        on_open = hide_line,
        on_close = function(term)
            show_line()
            term:shutdown()
        end,
    }):open()
end

vim.keymap.set("n", "<c-w>g", "<cmd>lua Lazygit_toggle()<cr>")
vim.keymap.set("n", "<space>g", "<cmd>lua Lazygit_toggle()<cr>")

function joshuto_toggle(path)
    local tmpfile = "/tmp/joshuto_chosenfile"
    local path_name = vim.fn.escape(vim.fn.expand(path), "[]()\\（） ")
    local joshuto_cmd = "joshuto --file-chooser --output-file=" .. tmpfile .. " " .. path_name

    Terminal:new({
        cmd = joshuto_cmd,
        start_in_insert = true,
        close_on_exit = true,
        direction = "tab",
        on_open = hide_line,
        on_close = function(term)
            show_line()
            if vim.fn.filereadable(tmpfile) then
                local ok, selected_file = pcall(vim.fn.readfile, tmpfile)
                if ok then
                    for _, v in ipairs(selected_file) do
                        vim.schedule(function()
                            vim.api.nvim_command("edit " .. v)
                        end)
                    end
                end
                vim.fn.delete(tmpfile)
            end
            term:shutdown()
        end,
    }):open()
end

vim.keymap.set("n", "<space>e", "<cmd>lua joshuto_toggle('%:p:h')<cr>")

vim.api.nvim_create_user_command("Glow", function()
    local path_name = vim.fn.escape(vim.fn.expand "%:p", "[]()\\（） ")
    Terminal:new({
        cmd = "glow -p " .. path_name,
        start_in_insert = true,
        close_on_exit = true,
        direction = "tab",
        on_open = hide_line,
        on_close = function(term)
            show_line()
            term:shutdown()
        end,
    }):open()
end, { complete = "file", nargs = "*", bang = true })
