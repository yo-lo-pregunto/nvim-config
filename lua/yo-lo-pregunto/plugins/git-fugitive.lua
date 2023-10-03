return {
    "tpope/vim-fugitive",
    config = function ()
        local opts = { noremap = true, silent = true, desc = "Git" }
        local k = vim.keymap
        k.set("n", "<leader>g", "<cmd>G<cr>", opts)
    end,
}
