local if_nil = vim.F.if_nil
local str_rep = string.rep
local strdisplaywidth = vim.fn.strdisplaywidth

local function button(sc, txt, keybind, keybind_opts)
    local shortcut_padding = 50 - (strdisplaywidth(sc) + strdisplaywidth(txt))
    local opts = {
        position = "center",
        shortcut = txt .. str_rep(" ", shortcut_padding) .. sc,
        cursor = 3,
        width = 50,
        align_shortcut = "left",
        hl_shortcut = { { "String", 0, 5 }, { "Text", 5, 50 }, { "Constant", 50, 100 } },
        shrink_margin = false,
    }
    if keybind then
        keybind_opts = if_nil(keybind_opts, { noremap = true, silent = true, nowait = true })
        opts.keymap = { "n", sc, keybind, keybind_opts }
    end

    local function on_press()
        local key = vim.api.nvim_replace_termcodes(keybind .. "<Ignore>", true, false, true)
        vim.api.nvim_feedkeys(key, "t", false)
    end

    return {
        type = "button",
        val = "",
        on_press = on_press,
        opts = opts,
    }
end

return {
    "goolord/alpha-nvim",
    event = "VimEnter",
    config = function()
        local status_ok, alpha = pcall(require, "alpha")
        if not status_ok then
            return
        end

        local theta = require "alpha.themes.theta"
        local cdir = vim.fn.getcwd()

        local section_header = {
            type = "text",
            val = {
                [[                                                                    ]],
                [[      ███████████           █████      ██                     ]],
                [[     ███████████             █████                             ]],
                [[     ████████████████ ███████████ ███   ███████     ]],
                [[    ████████████████ ████████████ █████ ██████████████   ]],
                [[   ██████████████    █████████████ █████ █████ ████ █████   ]],
                [[ ██████████████████████████████████ █████ █████ ████ █████  ]],
                [[██████  ███ █████████████████ ████ █████ █████ ████ ██████ ]],
            },
            opts = {
                hl = "String",
                shrink_margin = false,
                position = "center",
            },
        }

        local section_mru = {
            type = "group",
            val = {
                {
                    type = "text",
                    val = "Recent files",
                    opts = {
                        hl = "Operator",
                        shrink_margin = false,
                        position = "center",
                    },
                },
                { type = "padding", val = 1 },
                {
                    type = "group",
                    val = function()
                        return { theta.mru(1, cdir, 6) }
                    end,
                    opts = { shrink_margin = false },
                },
            },
        }

        local lazy_footer = function()
            local stats = require("lazy").stats()
            local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
            return "󰊠 Neovim loaded " .. stats.count .. " plugins in " .. ms .. "ms "
        end

        local section_actions = {
            type = "group",
            val = {
                { type = "text", val = "Quick Actions", opts = { hl = "Operator", position = "center" } },
                { type = "padding", val = 1 },
                button("s", "󱝴  Session", ":ReadSession<CR>"),
                button("n", "󱇧  New file", ":ene <BAR> startinsert <CR>"),
                button("f", "󰱼  Find file", ":Telescope find_files theme=dropdown previewer=false<cr>"),
                button("g", "󰷊  Git status", ":Telescope git_status theme=dropdown previewer=false<cr>"),
                button("w", "󰱽  Find word", ":Telescope live_grep theme=dropdown<CR>"),
                button("u", "󱈖  Sync plugins", ":Lazy sync<CR>"),
                button("c", "󱁻  Check health", ":checkhealth<CR>"),
                button("q", "󰪹  Quit", "<Cmd>qa<CR>"),
            },
            position = "center",
        }

        local section_footer = {
            type = "group",
            val = {
                { type = "text", val = lazy_footer, opts = { hl = "Comment", position = "center" } },
            },
        }

        theta.header.val = ""

        local opts = {
            layout = {
                { type = "padding", val = 2 },
                section_header,
                { type = "padding", val = 2 },
                section_mru,
                { type = "padding", val = 2 },
                section_actions,
                { type = "padding", val = 2 },
                section_footer,
            },
            opts = {
                margin = 5,
                setup = function()
                    vim.api.nvim_create_autocmd("DirChanged", {
                        pattern = "*",
                        group = "alpha_temp",
                        callback = function()
                            require("alpha").redraw()
                        end,
                    })
                    vim.api.nvim_create_autocmd("User", {
                        pattern = "AlphaReady",
                        group = vim.api.nvim_create_augroup("AlphaReadyGroup", { clear = true }),
                        callback = function()
                            vim.b.miniindentscope_disable = true
                            vim.opt.showtabline = 0
                            vim.opt.laststatus = 0

                            vim.api.nvim_create_autocmd("User", {
                                pattern = "LazyVimStarted",
                                callback = function()
                                    require("alpha").redraw()
                                end,
                            })

                            vim.api.nvim_create_autocmd("BufUnload", {
                                buffer = 0,
                                group = vim.api.nvim_create_augroup("AlphaUnloadGroup", { clear = true }),
                                callback = function()
                                    vim.opt.showtabline = 2
                                    vim.opt.laststatus = 3
                                end,
                            })
                        end,
                    })
                end,
            },
        }

        alpha.setup(opts)
    end,
}
