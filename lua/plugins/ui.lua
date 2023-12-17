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

    -- For current word highlighting
    {
        "RRethy/vim-illuminate",
        opts = {
            delay = 100,
            large_file_cutoff = 2000,
            large_file_overrides = {
                providers = { "lsp" },
            },
        },
        config = function(_, opts)
            require("illuminate").configure(opts)

        -- Not sure if I really needs the keymaps.
        --     local function map(key, dir, buffer)
        --         vim.keymap.set("n", key, function()
        --             require("illuminate")["goto_" .. dir .. "_reference"](false)
        --         end, { desc = dir:sub(1, 1):upper() .. dir:sub(2) .. " Reference", buffer = buffer })
        --     end
        --
        --     map("]]", "next")
        --     map("[[", "prev")
        --
        --     -- also set it after loading ftplugins, since a lot overwrite [[ and ]]
        --     vim.api.nvim_create_autocmd("FileType", {
        --         callback = function()
        --             local buffer = vim.api.nvim_get_current_buf()
        --             map("]]", "next", buffer)
        --             map("[[", "prev", buffer)
        --         end,
        --     })
        end,
        -- keys = {
        --     { "]]", desc = "Next Reference" },
        --     { "[[", desc = "Prev Reference" },
        -- },
    }
}
