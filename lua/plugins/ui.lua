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

    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        opts = {
            options = {
                theme = "dracula",
                disabled_filetypes = {
                    statusline = {"NvimTree"},
                },
                ignore_focus = {},
            },
            sections = {
                lualine_a = { 'mode' },
                lualine_b = {'branch', 'diagnostics'},
                lualine_c = { {'filename', path = 1} },
                lualine_x = { },
                lualine_y = { { "venv-selector", icon = "", } },
                lualine_z = { '%l/%L:%02c' },
            },
            inactive_sections = {
                lualine_c = { {'filename', path =1} },
                lualine_x = {'location'},
            },
            extensions = { "neo-tree", "lazy", "toggleterm" },
        },
        config = function (_, opts)
            vim.opt.showmode = false
            require('lualine').setup(opts)
        end
    },

    -- For current word highlighting
    {
        "RRethy/vim-illuminate",
        opts = {
            delay = 100,
            large_file_cutoff = 2000,
            large_file_overrides = {
                providers = { "lsp" },
            },
            modes_denylist = {
                "v",
                "vs",
                "V",
                "Vs",
                "<C-V>",
                "<C-V>s",
            }
        },
        config = function(_, opts)
            vim.api.nvim_set_hl(0, "IlluminatedWordText", { link = "Search" })
            vim.api.nvim_set_hl(0, "IlluminatedWordRead", { link = "Search" })
            vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { link = "Search" })
            require("illuminate").configure(opts)

        end,
    }
    },
    },
}
