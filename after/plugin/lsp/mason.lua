local function append(opts, description)
    opts.desc = description
    return opts
end
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
  vim.keymap.set('n', '<C-h>', vim.lsp.buf.signature_help, append(opts, "Sign Help"))
  vim.keymap.set('n', '<leader>vrn', vim.lsp.buf.rename, append(opts, "Rename"))
  vim.keymap.set('n', '<leader>vca', vim.lsp.buf.code_action, append(opts, "Code action"))
  vim.keymap.set('n', '<leader>vrr', vim.lsp.buf.references, append(opts, "References"))
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, append(opts, "Prev Diag"))
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, append(opts, "Next Diag"))
  vim.keymap.set('n', '<leader>vd', vim.diagnostic.open_float, append(opts, "Line Diag"))
  vim.keymap.set('n', '<leader>vD', vim.diagnostic.setloclist, append(opts, "Buffer Diag"))
end

local border = {
      {"╭", "FloatBorder"},
      {"─", "FloatBorder"},
      {"╮", "FloatBorder"},
      {"⎪", "FloatBorder"},
      {"╯", "FloatBorder"},
      {"─", "FloatBorder"},
      {"╰", "FloatBorder"},
      {"⎪", "FloatBorder"},
}

-- LSP settings (for overriding per client)
local handlers =  {
    ["textDocument/hover"] =  vim.lsp.with(vim.lsp.handlers.hover, {border = border}),
    ["textDocument/signatureHelp"] =  vim.lsp.with(vim.lsp.handlers.signature_help, {border = border }),
}

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}

-- Setup diagnostics
vim.diagnostic.config({
	virtual_text = false,
	signs = true,
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
local servers = { 'lua_ls', 'clangd', 'pyright', 'bashls', 'ltex' }
lsp.setup({
	ensure_installed = servers
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lspconfig = require('lspconfig')

lspconfig.lua_ls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    handlers = handlers,
    flags = lsp_flags,
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
    },
}

lspconfig.clangd.setup({
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = capabilities,
    handlers = handlers,
})

lspconfig.pyright.setup({
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = capabilities,
    handlers = handlers,
})

lspconfig.bashls.setup({
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = capabilities,
    handlers = handlers,
})

lspconfig.ltex.setup({
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = capabilities,
    handlers = handlers,
})

lspconfig.rust_analyzer.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    handlers = handlers,
    flags = lsp_flags,
    cmd = {
        "rustup", "run", "stable", "rust-analyzer",
    }
}
