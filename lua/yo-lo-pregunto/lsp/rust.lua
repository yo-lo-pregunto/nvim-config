local defaults = require("yo-lo-pregunto.lsp.core")

return {
    rust_analyzer = {
        on_attach = defaults.on_attach,
        capabilities = defaults.capabilities,
        lsp_flags = defaults.lsp_flags,
        cmd = {
            "rustup", "run", "stable", "rust-analyzer",
        }
    }
}
