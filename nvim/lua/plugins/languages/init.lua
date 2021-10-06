local languages = {}
local insert = _G.insert(languages)

insert {
    "williamboman/nvim-lsp-installer",
    cmd = {
        "LspInstallInfo",
        "LspInstall",
        "LspUninstall",
        "LspUninstallAll",
        "LspPrintInstalled",
    },
}

insert {
    "neovim/nvim-lspconfig",
    config = function()
        require "plugin.languages.lsp-config"
    end,
}

insert "jose-elias-alvarez/nvim-lsp-ts-utils"


return languages
