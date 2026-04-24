vim.pack.add {
    {
        src = "https://github.com/nvim-mini/mini.completion",
        version = "main",
    },
    {
        src = "https://github.com/nvim-mini/mini.snippets",
        version = "main",
    },
    {
        src = "https://github.com/rafamadriz/friendly-snippets",
    },
}

local function snippet_lang_patterns(lang)
    return {
        lang .. "/**/*.json",
        lang .. "/**/*.lua",
        "**/" .. lang .. ".json",
        "**/" .. lang .. ".lua",
        "custom-react.json",
    }
end

local snippets = require "mini.snippets"
local gen_loader = snippets.gen_loader
snippets.setup {
    snippets = {
        gen_loader.from_lang {
            lang_patterns = {
                javascript = snippet_lang_patterns "javascript",
                javascriptreact = snippet_lang_patterns "javascriptreact",
                typescript = snippet_lang_patterns "typescript",
                typescriptreact = snippet_lang_patterns "typescriptreact",
                markdown_inline = { "markdown.json" },
            },
        },
        gen_loader.from_file ".vscode/project.code-snippets",
    },
}

local completion = require "mini.completion"
local process_items = function(items, base)
    return completion.default_process_items(items, base, {
        filtersort = "fuzzy",
        kind_priority = { Text = -1, Snippet = 99 },
    })
end

completion.setup {
    lsp_completion = {
        source_func = "omnifunc",
        auto_setup = false,
        process_items = process_items,
    },
    mappings = {
        force_twostep = "<C-Space>",
        force_fallback = "<A-Space>",
        scroll_down = "",
        scroll_up = "",
    },
}

local disabled_completion_filetypes = {
    help = true,
    markdown = true,
    minifiles = true,
    snacks_picker_input = true,
}

local function disable_completion_if_needed(buf)
    if disabled_completion_filetypes[vim.bo[buf].filetype] then
        vim.b[buf].minicompletion_disable = true
    end
end

vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("mini-completion-disable", { clear = true }),
    callback = function(ev)
        disable_completion_if_needed(ev.buf)
    end,
})
disable_completion_if_needed(0)

MiniSnippets.start_lsp_server { match = false }

vim.keymap.set("i", "<Tab>", function()
    if vim.fn.pumvisible() == 1 then
        return vim.keycode "<C-n>"
    end
    return vim.keycode "<Tab>"
end, { expr = true, desc = "Next completion item" })

vim.keymap.set("i", "<S-Tab>", function()
    if vim.fn.pumvisible() == 1 then
        return vim.keycode "<C-p>"
    end
    return vim.keycode "<BS>"
end, { expr = true, desc = "Previous completion item" })

vim.keymap.set("i", "<CR>", function()
    if vim.fn.complete_info().selected ~= -1 then
        return vim.keycode "<C-y>"
    end
    if _G.MiniPairs then
        return MiniPairs.cr()
    end
    return vim.keycode "<CR>"
end, { expr = true, desc = "Accept completion or newline" })

vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
    once = true,
    callback = function()
        vim.pack.add {
            {
                src = "https://github.com/nvim-mini/mini.bufremove",
                version = "main",
            },
            {
                src = "https://github.com/nvim-mini/mini.comment",
                version = "main",
            },
            {
                src = "https://github.com/JoosepAlviste/nvim-ts-context-commentstring",
                version = "main",
            },
            {
                src = "https://github.com/nvim-mini/mini.pairs",
                version = "main",
            },
            {
                src = "https://github.com/nvim-mini/mini.surround",
                version = "main",
            },
            {
                src = "https://github.com/nvim-mini/mini.hipatterns",
                version = "main",
            },
        }

        require("mini.bufremove").setup()
        vim.keymap.set("n", "<leader>x", "<cmd>lua MiniBufremove.delete()<cr>")

        require("mini.comment").setup {
            options = {
                custom_commentstring = function()
                    return require("ts_context_commentstring").calculate_commentstring() or vim.bo.commentstring
                end,
            },
            mappings = {
                -- Toggle comment (like `gcip` - comment inner paragraph) for both
                -- Normal and Visual modes
                comment = "gc",

                -- Toggle comment on current line
                comment_line = "<C-_>",

                -- Toggle comment on visual selection
                comment_visual = "<C-_>",

                -- Define 'comment' textobject (like `dgc` - delete whole comment block)
                -- Works also in Visual mode if mapping differs from `comment_visual`
                textobject = "gc",
            },
        }
        require("mini.pairs").setup {
            modes = { command = true },
        }
        require("mini.surround").setup()
        local hipatterns = require "mini.hipatterns"
        hipatterns.setup {
            highlighters = {
                -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
                fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
                hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
                todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
                note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },

                -- Highlight hex color strings (`#rrggbb`) using that color
                hex_color = hipatterns.gen_highlighter.hex_color(),
            },
        }
    end,
})
