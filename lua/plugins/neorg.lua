return {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        require("neorg").setup {
            load = {
                ["core.defaults"] = {}, -- Loads default behaviour
                ["core.concealer"] = {
                    config = {
                        folds = true,
                        icons_preset = "diamond",
                    },
                }, -- Adds pretty icons to your documents
                ["core.dirman"] = { -- Manages Neorg workspaces
                    config = {
                        workspaces = {
                            notes = "~/Neorg/notes",
                        },
                        default_workspace = "notes",
                    },
                    ["core.completion"] = { config = { engine = "nvim-cmp", name = "[Norg]" } },
                    ["core.integrations.nvim-cmp"] = {},
                },
                ["core.summary"] = {},
                ["core.journal"] = {
                    config = {
                        journal_folder = "../journal",
                        strategy = "flat",
                    }

                },
                ["core.esupports.metagen"] = {},
        },
    }
end,
}
