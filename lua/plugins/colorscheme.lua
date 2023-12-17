return {
    "catppuccin/nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("catppuccin").setup({
            flavour = 'mocha',
            term_colors = true,
            transparent_background = false,
        })

        vim.cmd.colorscheme("catppuccin")
    end,
}
