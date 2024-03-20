return {
    "catppuccin/nvim",
    lazy = false,
    priority = 1000,
    dependencies = {
        "projekt0n/github-nvim-theme",
        "jacoborus/tender.vim",
        "bluz71/vim-moonfly-colors",
        "EdenEast/nightfox.nvim",
    },
    config = function()
        require("catppuccin").setup({
            flavour = 'mocha',
            term_colors = true,
            transparent_background = false,
        })

        vim.cmd.colorscheme("carbonfox")
    end,
}
