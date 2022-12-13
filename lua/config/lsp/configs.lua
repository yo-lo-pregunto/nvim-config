local status_ok, mason = pcall(require, "mason")
if not status_ok then
	return
end

local status, lsp_installer = pcall(require, "mason-lspconfig")
if not status then
	return
end

mason.setup()

local lspconfig = require("lspconfig")

local servers = { "sumneko_lua", "clangd", "pyright", "rust_analyzer", "bashls" }

lsp_installer.setup({
	ensure_installed = servers,
})

for _, server in pairs(servers) do
	local opts = {
		on_attach = require("config.lsp.handlers").on_attach,
		capabilities = require("config.lsp.handlers").capabilities,
	}
	local has_custom_opts, server_custom_opts = pcall(require, "config.lsp.settings." .. server)
	if has_custom_opts then
		opts = vim.tbl_deep_extend("force", opts, server_custom_opts)
	end
	lspconfig[server].setup(opts)
end
