local defaults = require("yo-lo-pregunto.lsp.core")

return {
    lua_ls = {
        on_attach = defaults.on_attach,
        capabilities = defaults.capabilities,
        lsp_flags = defaults.lsp_flags,
        settings = {
            Lua = {
                diagnostics = {
                    globals = { "vim" },
                },
                workspace = {
                    library = {
                        [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                        [vim.fn.stdpath("config") .. "/lua"] = true,
                    },
                },
            },

        }
    }
}
