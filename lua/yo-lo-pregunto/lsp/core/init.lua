
local M = {}

local capabilities = require("cmp_nvim_lsp").default_capabilities()

function M.on_attach(client, bufnr)
    local k = vim.keymap
    local opts = { noremap = true, silent = true, buffer = bufnr }

      opts.desc = "References"
      k.set("n", "gR", vim.lsp.buf.references, opts) -- show definition, references

      opts.desc = "Declaration"
      k.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

      opts.desc = "Definitions"
      k.set("n", "gd", vim.lsp.buf.definition, opts) -- show lsp definitions

      opts.desc = "Hover"
      k.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

      opts.desc = "Code Actions"
      k.set({ "n", "v" }, "<leader>la", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

      opts.desc = "Smart rename"
      k.set("n", "<leader>lr", vim.lsp.buf.rename, opts) -- smart rename

      opts.desc = "Buffer Diagnostics"
      k.set("n", "<leader>lD", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

      opts.desc = "Diagnostics"
      k.set("n", "<leader>lq", vim.diagnostic.setloclist, opts) -- show  diagnostics for file

      opts.desc = "Show line diagnostics"
      k.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

      opts.desc = "Previous diagnostic"
      k.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

      opts.desc = "Next diagnostic"
      k.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

      opts.desc = "Restart"
      k.set("n", "<leader>lR", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
end

M.capabilities = capabilities
M.lsp_flags = {
    debounce_text_changes = 150,
}

return M
