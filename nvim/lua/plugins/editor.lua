return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        build = ":TSUpdate",
        event = { "VeryLazy" },
        cmd = { "TSUpdate", "TSInstall", "TSLog", "TSUninstall" },
        config = function()
            -- Use tree-sitter for indentation and folding on supported filetypes
            vim.api.nvim_create_autocmd("FileType", {
                group = vim.api.nvim_create_augroup("nvim-treesitter", { clear = true }),
                callback = function(ev)
                    if pcall(vim.treesitter.start, ev.buf) then
                        vim.bo.indentexpr = "v:lua.vim.treesitter.indentexpr()"
                        vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
                        vim.wo[0][0].foldmethod = "expr"
                    end
                end,
            })
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        branch = "main",
        event = "VeryLazy",
        opts = {
            select = {
                lookahead = true,
                include_surrounding_whitespace = false,
            },
            move = {
                set_jumps = true,
            },
        },
        config = function(_, opts)
            require("nvim-treesitter-textobjects").setup(opts)

            local select = require("nvim-treesitter-textobjects.select").select_textobject
            local swap_next = require("nvim-treesitter-textobjects.swap").swap_next
            local swap_prev = require("nvim-treesitter-textobjects.swap").swap_previous
            local goto_next_start = require("nvim-treesitter-textobjects.move").goto_next_start
            local goto_next_end = require("nvim-treesitter-textobjects.move").goto_next_end
            local goto_previous_start = require("nvim-treesitter-textobjects.move").goto_previous_start
            local goto_previous_end = require("nvim-treesitter-textobjects.move").goto_previous_end

            -- Move
            vim.keymap.set({ "n", "x", "o" }, "]f", function()
                goto_next_start("@function.outer", "textobjects")
            end)
            vim.keymap.set({ "n", "x", "o" }, "]c", function()
                goto_next_start("@comment.outer", "textobjects")
            end)
            vim.keymap.set({ "n", "x", "o" }, "]F", function()
                goto_next_end("@function.outer", "textobjects")
            end)
            vim.keymap.set({ "n", "x", "o" }, "]C", function()
                goto_next_end("@comment.outer", "textobjects")
            end)
            vim.keymap.set({ "n", "x", "o" }, "[f", function()
                goto_previous_start("@function.outer", "textobjects")
            end)
            vim.keymap.set({ "n", "x", "o" }, "[c", function()
                goto_previous_start("@comment.outer", "textobjects")
            end)
            vim.keymap.set({ "n", "x", "o" }, "[F", function()
                goto_previous_end("@function.outer", "textobjects")
            end)
            vim.keymap.set({ "n", "x", "o" }, "[C", function()
                goto_previous_end("@comment.outer", "textobjects")
            end)
        end,
    },
    {
        "nvim-mini/mini.ai",
        event = "VeryLazy",
        opts = function()
            local ai = require "mini.ai"
            return {
                n_lines = 500,
                custom_textobjects = {
                    o = ai.gen_spec.treesitter { -- code block
                        a = { "@block.outer", "@conditional.outer", "@loop.outer" },
                        i = { "@block.inner", "@conditional.inner", "@loop.inner" },
                    },
                    a = ai.gen_spec.treesitter { a = "@parameter.outer", i = "@parameter.inner" }, --parameter
                    f = ai.gen_spec.treesitter { a = "@function.outer", i = "@function.inner" }, -- function
                    c = ai.gen_spec.treesitter { a = "@comment.outer", i = "@comment.inner" }, -- comment
                    t = { "<([%p%w]-)%f[^<%w][^<>]->.-</%1>", "^<.->().*()</[^/]->$" }, -- tags
                    d = { "%f[%d]%d+" }, -- digits
                    e = { -- Word with case
                        {
                            "%u[%l%d]+%f[^%l%d]",
                            "%f[%S][%l%d]+%f[^%l%d]",
                            "%f[%P][%l%d]+%f[^%l%d]",
                            "^[%l%d]+%f[^%l%d]",
                        },
                        "^().*()$",
                    },
                },
            }
        end,
    },
    {
        "jake-stewart/multicursor.nvim",
        branch = "1.0",
        event = "VeryLazy",
        config = function()
            local mc = require "multicursor-nvim"
            mc.setup()

            local set = vim.keymap.set

            -- Add or skip cursor above/below the main cursor.
            set({ "n", "x" }, "<up>", function()
                mc.lineAddCursor(-1)
            end)
            set({ "n", "x" }, "<down>", function()
                mc.lineAddCursor(1)
            end)
            set({ "n", "x" }, "<leader><up>", function()
                mc.lineSkipCursor(-1)
            end)
            set({ "n", "x" }, "<leader><down>", function()
                mc.lineSkipCursor(1)
            end)

            -- Add or skip adding a new cursor by matching word/selection
            set({ "n", "x" }, "<leader>n", function()
                mc.matchAddCursor(1)
            end)
            set({ "n", "x" }, "<leader>s", function()
                mc.matchSkipCursor(1)
            end)
            set({ "n", "x" }, "<leader>N", function()
                mc.matchAddCursor(-1)
            end)
            set({ "n", "x" }, "<leader>S", function()
                mc.matchSkipCursor(-1)
            end)

            -- Match all occurrences
            set({ "n", "x" }, "<Leader>A", mc.matchAllAddCursors)

            -- Toggle cursor
            set({ "n", "x" }, "<C-q>", mc.toggleCursor)

            -- Keymap layer (only active with multiple cursors)
            mc.addKeymapLayer(function(layerSet)
                -- Navigate cursors
                layerSet({ "n", "x" }, "<Left>", mc.prevCursor)
                layerSet({ "n", "x" }, "<Right>", mc.nextCursor)

                -- Delete cursor
                layerSet({ "n", "x" }, "<Leader>x", mc.deleteCursor)

                -- Escape to clear/enable
                layerSet("n", "<Esc>", function()
                    if not mc.cursorsEnabled() then
                        mc.enableCursors()
                    else
                        mc.clearCursors()
                    end
                end)
            end)

            -- Align cursors
            set("n", "<Leader>a", mc.alignCursors)

            -- Restore accidentally cleared cursors
            set("n", "<Leader>gv", mc.restoreCursors)
        end,
    },
    { "nvim-mini/mini.pairs", event = "VeryLazy", opts = {} },
    { "nvim-mini/mini.surround", event = "VeryLazy", opts = {} },
    {
        "nvim-mini/mini.hipatterns",
        event = "VeryLazy",
        config = function()
            local hipatterns = require "mini.hipatterns"
            hipatterns.setup {
                highlighters = {
                    fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
                    hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
                    todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
                    note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },
                    hex_color = hipatterns.gen_highlighter.hex_color(),
                },
            }
        end,
    },
    {
        "nvim-mini/mini.comment",
        event = "VeryLazy",
        config = function()
            require("mini.comment").setup {
                options = {
                    custom_commentstring = function()
                        return require("ts_context_commentstring").calculate_commentstring() or vim.bo.commentstring
                    end,
                },
                mappings = {
                    comment = "gc",
                    comment_line = "<C-/>",
                    comment_visual = "<C-/>",
                    textobject = "gc",
                },
            }
        end,
    },
    {
        "JoosepAlviste/nvim-ts-context-commentstring",
        event = "VeryLazy",
    },
    {
        "MagicDuck/grug-far.nvim",
        opts = { headerMaxWidth = 80 },
        cmd = { "GrugFar", "GrugFarWithin" },
        keys = {
            {
                "<leader>sr",
                function()
                    local grug = require "grug-far"
                    local ext = vim.bo.buftype == "" and vim.fn.expand "%:e"
                    grug.open {
                        transient = true,
                        prefills = {
                            filesFilter = ext and ext ~= "" and "*." .. ext or nil,
                        },
                    }
                end,
                mode = { "n", "x" },
                desc = "Search and Replace",
            },
        },
    },
}
