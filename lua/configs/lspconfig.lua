local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = { "html", "cssls", "clangd" }

-- Configurar log_level para todos los servidores
lspconfig.util.default_config = vim.tbl_extend("force", lspconfig.util.default_config, {
    log_level = vim.lsp.protocol.MessageType.Error, -- Solo mostrar errores críticos
})

-- lsps with default config
for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        on_attach = on_attach,
        on_init = on_init,
        capabilities = capabilities,
    }
end

--typescript
lspconfig.ts_ls.setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
}

-- c/cpp
lspconfig.clangd.setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
    cmd = {
        "clangd",
        "--offset-encoding=utf-16",
    },
}

-- python
lspconfig.pyright.setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
}

--emmet
lspconfig.emmet_language_server.setup {
    filetypes = { "html", "css", "javascriptreact", "typescriptreact", "astro" },
}
