local Terminal = require("toggleterm.terminal").Terminal

local function show_line()
    vim.opt.laststatus = 3
    vim.opt.showtabline = 2
    vim.opt.cmdheight = 1
end

local function hide_line()
    vim.opt.laststatus = 0
    vim.opt.cmdheight = 0
    vim.opt.showtabline = 0
end

function Lazygit_toggle()
    local lazygit = Terminal:new {
        cmd = "lazygit",
        start_in_insert = true,
        close_on_exit = true,
        direction = "tab",
        on_open = hide_line,
        on_close = show_line,
    }
    lazygit:open()
end

vim.keymap.set("n", "<c-w>g", "<cmd>lua Lazygit_toggle()<cr>")
vim.keymap.set("n", "<space>g", "<cmd>lua Lazygit_toggle()<cr>")

function LF_toggle(path)
    local tmpfile = "/tmp/lf_chosenfile"
    local path_name = vim.fn.escape(vim.fn.expand(path), "[]()\\（） ")
    local lf_cmd = "lf -selection-path=" .. tmpfile .. " " .. path_name

    local lf = Terminal:new {
        cmd = lf_cmd,
        start_in_insert = true,
        close_on_exit = true,
        direction = "tab",
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

vim.keymap.set("n", "<space>e", "<cmd>lua LF_toggle('%')<cr>")

vim.api.nvim_create_user_command("Glow", function()
    local path_name = vim.fn.escape(vim.fn.expand "%:p", "[]()\\（） ")
    Terminal:new({
        cmd = "glow -p " .. path_name,
        start_in_insert = true,
        close_on_exit = true,
        direction = "tab",
        on_open = hide_line,
        on_close = show_line,
    }):open()
end, { complete = "file", nargs = "*", bang = true })
