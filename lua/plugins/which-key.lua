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
            ["<leader>g"] = { name = "Git", _ = 'which_key_ignore' },
            ["<leader>q"] = { name = "Quit" },
            ["<leader>s"] = { name = "Search", _ = 'which_key_ignore' },
            ["<leader>;"] = { name = "Harpoon", _ = 'which_key_ignore' },
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
