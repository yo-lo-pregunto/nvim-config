return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
    },

    config = function()
        local mason = require("mason")
        local mason_lspconfig = require("mason-lspconfig")
        local servers = require("yo-lo-pregunto.lsp")
        local ensure_installed = {}

        for k,_ in pairs(servers) do
            if k ~= "rust_analyzer" then
                table.insert(ensure_installed, k)
            end
        end

        mason.setup()
        mason_lspconfig.setup({
            ensure_installed = ensure_installed,
        })
    end
}
