local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require("illuminate").configure({
        modes_allowlist = {'n'},
      filetypes_denylist = {
        "NvimTree",
        "help"
      },
    })

vim.api.nvim_set_hl(0, "IlluminatedWordRead", { link = "Visual", underline = false, bold = true })
vim.api.nvim_set_hl(0, "IlluminatedWordText", { link = "Visual", underline = false, bold = true })
vim.api.nvim_set_hl(0, "IlluminatedWordWrite",{ link = "Visual", underline = false, bold = true })

require "config.lsp.configs"
require("config.lsp.handlers").setup()
-- require "user.lsp.null-ls"
