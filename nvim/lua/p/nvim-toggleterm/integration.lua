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

function Lazygit_toggle()
    lazygit:toggle()
end

map_cmd("n|<c-w>g", "lua Lazygit_toggle()")
map_cmd("n|<leader>g", "lua Lazygit_toggle()")

function LF_toggle(path)
    local tmpfile = "/tmp/lf_chosenfile"
    local path_name = vim.fn.escape(vim.fn.expand(path), "[]()\\（） ")
    local lf_cmd = "lf -selection-path=" .. tmpfile .. " " .. path_name

    local lf = Terminal:new {
        cmd = lf_cmd,
        start_in_insert = true,
        direction = "window",
        on_open = hide_line,
        on_close = function()
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
        end,
    }
    lf:open()
end

map_cmd("n|<leader>e", "lua LF_toggle('%')")
