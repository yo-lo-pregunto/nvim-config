local defaults = require("yo-lo-pregunto.lsp.core")

return {
    clangd = {
        on_attach = defaults.on_attach,
        capabilities = defaults.capabilities,
        lsp_flags = defaults.lsp_flags,
    }
}
