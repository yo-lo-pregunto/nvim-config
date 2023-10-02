return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
    },
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local lspconfig = require("lspconfig")
        local servers = require("yo-lo-pregunto.lsp")

        for server, config in pairs(servers) do
--            print("server: " ..server)
--            print("Properties:")
--            print(vim.inspect(config))
            lspconfig[server].setup(config)
        end

    end
}
