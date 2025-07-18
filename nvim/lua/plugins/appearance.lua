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
    {
        "goolord/alpha-nvim",
        event = "VimEnter",
        config = function()
            local status_ok, alpha = pcall(require, "alpha")
            if not status_ok then
                return
            end

            local theta = require "alpha.themes.theta"

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
                            return { theta.mru(1, vim.fn.getcwd(), 6) }
                        end,
                        opts = {
                            shrink_margin = false,
                        },
                    },
                },
            }

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
                    {
                        type = "text",
                        val = function()
                            local stats = require("lazy").stats()
                            local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
                            return "󰊠 Neovim loaded " .. stats.count .. " plugins in " .. ms .. "ms "
                        end,
                        opts = { hl = "Comment", position = "center" }
                    },
                },
            }

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
    },
    {
        "echasnovski/mini.icons",
        lazy = true,
        opts = {
            file = {
                [".keep"] = { glyph = "󰊢", hl = "MiniIconsGrey" },
                ["devcontainer.json"] = { glyph = "", hl = "MiniIconsAzure" },
            },
            filetype = {
                dotenv = { glyph = "", hl = "MiniIconsYellow" },
            },
        },
        init = function()
            ---@diagnostic disable-next-line: duplicate-set-field
            package.preload["nvim-web-devicons"] = function()
                require("mini.icons").mock_nvim_web_devicons()
                return package.loaded["nvim-web-devicons"]
            end
        end,
    },
    {
        "akinsho/bufferline.nvim",
        version = "*",
        dependencies = { 'echasnovski/mini.bufremove', version = false, opts = {} },
        event = "BufReadPost",
        opts = {
            options = {
                separator_style = "thin",
                modified_icon = "",
                show_close_icon = false,
                show_buffer_close_icons = false,
                offsets = {
                    {
                        filetype = "neo-tree",
                        text = "Neo-tree",
                        highlight = "Directory",
                        text_align = "left",
                    },
                    {
                        filetype = "snacks_layout_box",
                    },
                },
            },
            highlights = {
                separator = {
                    fg = '#343f44',
                    bg = '#343f44'
                },
                background = {
                    fg = '#859289',
                    bg = '#3d484d'
                },
                modified = {
                    bg = '#3d484d'
                },
                pick = {
                    bg = '#3d484d'
                },
                fill = {
                    bg = '#343f44'
                }
            },
        },
        keys = {
            {
                "[f",
                mode = { "n" },
                "<cmd>BufferLineCyclePrev<cr>",
                desc = "Prev Buffer",
            },
            {
                "]f",
                mode = { "n" },
                "<cmd>BufferLineCycleNext<cr>",
                desc = "Next Buffer",
            },
            {
                "[F",
                mode = { "n" },
                "<cmd>BufferLineMovePrev<cr>",
                desc = "Move Buffer Prev",
            },
            {
                "]F",
                mode = { "n" },
                "<cmd>BufferLineMoveNext<cr>",
                desc = "Move Buffer Next",
            },
            {
                "<bs>f",
                mode = { "n" },
                function ()
                    MiniBufremove.delete()
                end,
                desc = "Remove Buffer",
            },
            {
                "\\f",
                mode = { "n" },
                "<cmd>BufferLinePick<cr>",
                desc = "Show Buffer",
            },
            {
                "<space>1",
                mode = { "n" },
                "<cmd>BufferLineGoToBuffer 1<cr>",
                desc = "Go to buffer",
            },
            {
                "<space>2",
                mode = { "n" },
                "<cmd>BufferLineGoToBuffer 2<cr>",
                desc = "Go to buffer",
            },
            {
                "<space>3",
                mode = { "n" },
                "<cmd>BufferLineGoToBuffer 3<cr>",
                desc = "Go to buffer",
            },
            {
                "<space>4",
                mode = { "n" },
                "<cmd>BufferLineGoToBuffer 4<cr>",
                desc = "Go to buffer",
            },
            {
                "<space>5",
                mode = { "n" },
                "<cmd>BufferLineGoToBuffer 5<cr>",
                desc = "Go to buffer",
            },
            {
                "<space>6",
                mode = { "n" },
                "<cmd>BufferLineGoToBuffer 6<cr>",
                desc = "Go to buffer",
            },
            {
                "<space>7",
                mode = { "n" },
                "<cmd>BufferLineGoToBuffer 7<cr>",
                desc = "Go to buffer",
            },
            {
                "<space>8",
                mode = { "n" },
                "<cmd>BufferLineGoToBuffer 8<cr>",
                desc = "Go to buffer",
            },
            {
                "<space>9",
                mode = { "n" },
                "<cmd>BufferLineGoToBuffer 9<cr>",
                desc = "Go to buffer",
            },
            {
                "<space>0",
                mode = { "n" },
                "<cmd>BufferLineGoToBuffer -1<cr>",
                desc = "Go to buffer",
            },
        },
    },
    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        opts = function()
            return {
                options = {
                    theme = "auto",
                    component_separators = "",
                    section_separators = "",
                    globalstatus = true,
                    disabled_filetypes = {
                        statusline = {
                            'startify',
                            'dashboard',
                            'packer',
                            'neogitstatus',
                            'Trouble',
                            'alpha',
                            'lir',
                            'Outline',
                            'spectre_panel',
                            'toggleterm',
                            'qf',
                        },
                        winbar = {},
                    },
                },
                sections = {
                    lualine_a = {
                        { 'mode', fmt = function(str) return str:sub(1, 1) end }
                    },
                    lualine_b = {
                        "diagnostics",
                    },
                    lualine_c = {
                        {
                            "filename",
                            path = 3,
                            file_status = false,
                            newfile_status = false,
                        },
                    },
                    lualine_x = {
                        "bo:filetype",
                        "location",
                    },
                    lualine_y = {
                        { 'b:gitsigns_head', icon = '󰘬' },
                    },
                    lualine_z = {},
                },
                inactive_sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = { "filename" },
                    lualine_x = { "location" },
                    lualine_y = {},
                    lualine_z = {},
                },
                tabline = {},
                extensions = {},
            }
        end,
    },
}
