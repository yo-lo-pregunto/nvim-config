return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
        highlight = { enable = true },
        indent = { enable = true },
        auto_install = true,
        ensure_installed = { "c", "lua", "vim", "vimdoc", "query" },
    },
    config = function (_, opts)
        require("nvim-treesitter.configs").setup(opts)
    end,
}
