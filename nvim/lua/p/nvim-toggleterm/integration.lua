local Terminal = require("toggleterm.terminal").Terminal

local function show_line()
    vim.opt.laststatus = 2
    vim.opt.showtabline = 2
    vim.opt.showmode = true
    vim.opt.ruler = true
    vim.opt.showcmd = true
end

local function hide_line()
    vim.opt.laststatus = 0
    vim.opt.showtabline = 0
    vim.opt.showmode = false
    vim.opt.ruler = false
    vim.opt.showcmd = false
end

local lazygit = Terminal:new {
    cmd = "lazygit",
    start_in_insert = true,
    direction = "window",
    on_open = hide_line,
    on_close = show_line,
}

function _lazygit_toggle()
    lazygit:toggle()
end

map_cmd("n|<c-w>g", "lua _lazygit_toggle()")
map_cmd("n|<leader>g", "lua _lazygit_toggle()")

function _lf_toggle()
    local tmpfile = "/tmp/lf_chosenfile"
    local lf_cmd = "lf -selection-path=" .. tmpfile .. " " .. vim.fn.expand "%"

    local lf = Terminal:new {
        cmd = lf_cmd,
        start_in_insert = true,
        close_on_exit = true,
        direction = "window",
        on_open = hide_line,
        on_close = function(term)
            show_line()
            if vim.fn.filereadable(tmpfile) then
                local file = vim.fn.readfile(tmpfile)
                if file[1] ~= nil then
                    vim.api.nvim_command("edit " .. file[1])
                end
                vim.fn.delete(tmpfile)
            end
            term:shutdown()
        end,
    }
    lf:open()
end

map_cmd("n|<leader>e", "lua _lf_toggle()")
