return {
    "catppuccin/nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("catppuccin").setup({
            flavour = 'frappe',
            term_colors = true,
            transparent_background = true,
        })

        vim.cmd.colorscheme("catppuccin")
    end,
}
