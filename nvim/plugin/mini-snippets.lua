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

MiniSnippets.start_lsp_server { match = false }
