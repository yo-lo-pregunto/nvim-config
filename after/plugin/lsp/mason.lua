-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local opts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', '<C-h>', vim.lsp.buf.signature_help, opts)
  vim.keymap.set('n', '<leader>vrn', vim.lsp.buf.rename, opts)
  vim.keymap.set('n', '<leader>vca', vim.lsp.buf.code_action, opts)
  vim.keymap.set('n', '<leader>vrr', vim.lsp.buf.references, opts)
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
  vim.keymap.set('n', '<leader>vd', vim.diagnostic.open_float, opts)
  vim.keymap.set('n', '<leader>vD', vim.diagnostic.setloclist, opts)
end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}

-- Setup diagnostics
vim.diagnostic.config({
	virtual_text = false,
	signs = false,
	underline = true,
	float = {
		focusable = false,
		style = 'minimal',
		border = 'rounded',
		source = 'always',
		header = '',
		prefix = '',
	},
})

vim.api.nvim_create_autocmd(
  "FileType", {
  pattern={"qf"},
  command=[[nnoremap <buffer> <CR> <CR>:lclose<CR>]]})

-- Setup lsp
local mason = require('mason')
mason.setup()

local lsp = require('mason-lspconfig')
local servers = { 'lua_ls', 'clangd', 'pyright', 'rust_analyzer', 'bashls', 'ltex' }
lsp.setup({
	ensure_installed = servers
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lspconfig = require('lspconfig')
for _, server in pairs(servers) do
	lspconfig[server].setup({
		on_attach = on_attach,
		flags = lsp_flags,
		capabilities = capabilities,
	})
end
