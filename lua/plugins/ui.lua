return {
    {
        "echasnovski/mini.indentscope",
        version = "*", -- Stable
        event = "VeryLazy",
        opts = {
            symbol = "▏",
            -- symbol = "│",
            options = { try_as_border = true },
        },
        init = function()
            vim.api.nvim_create_autocmd("FileType", {
                pattern = {
                    "help",
                    "neo-tree",
                    "dashboard",
                    "lazy",
                    "mason",
                    "notify",
                    "toggleterm",
                    "lazyterm",
                    "dashboard",
                },
                callback = function()
                    vim.b.miniindentscope_disable = true
                end,
            })
        end,
    },
    -- indent guides for Neovim
    {
        "lukas-reineke/indent-blankline.nvim",
        event = "VeryLazy",
        opts = {
            indent = {
                char = "│",
                tab_char = "│",
            },
            scope = { enabled = false },
            exclude = {
                filetypes = {
                    "help",
                    "Trouble",
                    "neo-tree",
                    "lazy",
                    "mason",
                    "notify",
                    "toggleterm",
                    "lazyterm",
                    "dashboard",
                },
            },
        },
        main = "ibl",
    },
}
