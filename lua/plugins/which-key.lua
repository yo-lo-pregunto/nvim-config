return{
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
        plugins = { spelling = true },
        defaults = {
            mode = { "n", "v" },
            ["g"] = { name = "Goto" },
            ["]"] = { name = "Next" },
            ["["] = { name = "Prev" },
            ["gs"] = { name = "Sorround", _ = 'which_key_ignore' },
            ["<leader>g"] = { name = "Git", _ = 'which_key_ignore' },
            ["<leader>l"] = { name = "Lsp", _ = 'which_key_ignore' },
            ["<leader>s"] = { name = "Search", _ = 'which_key_ignore' },
            ["<leader>h"] = { name = "Harpoon", _ = 'which_key_ignore' },
            ["<leader>n"] = { name = "Node", _ = 'which_key_ignore' },
        },
    },
    config = function(_, opts)
        vim.opt.timeout = true
        vim.opt.timeoutlen = 300
        local wk = require("which-key")
        wk.setup(opts)
        wk.register(opts.defaults)
    end,
}
