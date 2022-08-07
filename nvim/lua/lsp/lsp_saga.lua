local saga = require "lspsaga"
local action = require "lspsaga.action"
local diagnostic = require "lspsaga.diagnostic"
local codeaction = require "lspsaga.codeaction"

saga.init_lsp_saga {
    -- Options with default value
    -- "single" | "double" | "rounded" | "bold" | "plus"
    border_style = "single",
    --the range of 0 for fully opaque window (disabled) to 100 for fully
    --transparent background. Values between 0-30 are typically most useful.
    saga_winblend = 0,
    -- when cursor in saga window you config these to move
    move_in_saga = { prev = "<C-p>", next = "<C-n>" },
    -- Error, Warn, Info, Hint
    -- use emoji like
    -- { "🙀", "😿", "😾", "😺" }
    -- or
    -- { "😡", "😥", "😤", "😐" }
    -- and diagnostic_header can be a function type
    -- must return a string and when diagnostic_header
    -- is function type it will have a param `entry`
    -- entry is a table type has these filed
    -- { bufnr, code, col, end_col, end_lnum, lnum, message, severity, source }
    diagnostic_header = { " ", " ", " ", " " },
    -- show diagnostic source
    show_diagnostic_source = true,
    -- add bracket or something with diagnostic source, just have 2 elements
    diagnostic_source_bracket = {},
    -- preview lines of lsp_finder and definition preview
    max_preview_lines = 10,
    -- use emoji lightbulb in default
    code_action_icon = "💡",
    -- if true can press number to execute the codeaction in codeaction window
    code_action_num_shortcut = true,
    -- same as nvim-lightbulb but async
    code_action_lightbulb = {
        enable = true,
        sign = true,
        enable_in_insert = true,
        sign_priority = 20,
        virtual_text = false,
    },
    -- finder icons
    finder_icons = {
        def = "  ",
        ref = "諭 ",
        link = "  ",
    },
    -- finder do lsp request timeout
    -- if your project big enough or your server very slow
    -- you may need to increase this value
    finder_request_timeout = 1500,
    finder_action_keys = {
        open = "<CR>",
        vsplit = "s",
        split = "i",
        tabe = "t",
        quit = "q",
        scroll_down = "<C-f>",
        scroll_up = "<C-b>", -- quit can be a table
    },
    code_action_keys = {
        quit = "q",
        exec = "<CR>",
    },
    rename_action_quit = "<C-c>",
    rename_in_select = true,
    definition_preview_icon = "  ",
    -- show symbols in winbar must nightly
    symbol_in_winbar = {
        in_custom = false,
        enable = false,
        separator = " ",
        show_file = true,
        click_support = false,
    },
    -- show outline
    show_outline = {
        win_position = "right",
        --set special filetype win that outline window split.like NvimTree neotree
        -- defx, db_ui
        win_with = "",
        win_width = 30,
        auto_enter = true,
        auto_preview = true,
        virt_text = "┃",
        jump_key = "<cr>",
        -- auto refresh when change buffer
        auto_refresh = true,
    },
    -- if you don't use nvim-lspconfig you must pass your server name and
    -- the related filetypes into this table
    -- like server_filetype_map = { metals = { "sbt", "scala" } }
    server_filetype_map = {},
}

return function(bufnr)
    local bufopts = { silent = true, buffer = bufnr }
    vim.keymap.set("n", "gr", "<cmd>Lspsaga lsp_finder<CR>", bufopts)
    vim.keymap.set("n", "gd", "<cmd>Lspsaga preview_definition<CR>", bufopts)
    vim.keymap.set("n", "gi", "<cmd>Lspsaga implement<CR>", bufopts)
    vim.keymap.set("n", "gs", "<cmd>Lspsaga signature_help<CR>", bufopts)
    vim.keymap.set("n", "<M-r>", "<cmd>Lspsaga rename<CR>", bufopts)
    vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", bufopts)

    vim.keymap.set("n", "\\d", diagnostic.show_line_diagnostics, bufopts)
    vim.keymap.set("n", "[d", diagnostic.goto_prev, bufopts)
    vim.keymap.set("n", "]d", diagnostic.goto_next, bufopts)
    vim.keymap.set("n", "[D", function()
        diagnostic.goto_prev { severity = vim.diagnostic.severity.ERROR }
    end, bufopts)
    vim.keymap.set("n", "]D", function()
        diagnostic.goto_next { severity = vim.diagnostic.severity.ERROR }
    end, bufopts)

    vim.keymap.set("n", "<space><enter>", codeaction.code_action, bufopts)
    vim.keymap.set("v", "<space><enter>", function()
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<C-U>", true, false, true))
        codeaction.range_code_action()
    end, bufopts)

    -- -- scroll down hover doc or scroll in definition preview
    -- vim.keymap.set("n", "<C-d>", function()
    --     action.smart_scroll_with_saga(1)
    -- end, bufopts)
    -- -- scroll up hover doc
    -- vim.keymap.set("n", "<C-u>", function()
    --     action.smart_scroll_with_saga(-1)
    -- end, bufopts)
end
