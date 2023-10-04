return {
    "akinsho/toggleterm.nvim",
    versin = "*",
    config = function ()
        vim.api.nvim_create_autocmd("TermOpen", {
            command = "setlocal nonu nornu signcolumn=no"
        })

        require("toggleterm").setup()
    end,
    keys = {
        { "<leader>t", "<cmd>ToggleTerm<cr>", { desc = "Terminal" } },
    }
}
