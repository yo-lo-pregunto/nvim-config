return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
        -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    opts = {
        source_selector = {
            winbar = true,
        },
        filesystem = {
            hijack_netrw_behavior = "open_current",
        },
        window = {
            mappings = {
                ["<space>"] = "none",
                ["h"] = "prev_source",
                ["l"] = "next_source",
                ["o"] = "toggle_node",
                ["oc"] = "none",
                ["od"] = "none",
                ["og"] = "none",
                ["om"] = "none",
                ["on"] = "none",
                ["os"] = "none",
                ["ot"] = "none",
            }
        },
        event_handlers = {
            {
                event = "file_opened",
                handler = function(_)
                    require("neo-tree.command").execute({ action = "close" })
                end
            },
        }
    },
    config = function(_, opts)
        require("neo-tree").setup(opts)
        vim.keymap.set("n", "<leader>e",
            function()
                require("neo-tree.command").execute({ toggle = true })
            end,
            { desc = "Explorer" })
    end,
}
