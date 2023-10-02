return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")
        local builtin = require("telescope.builtin")

        telescope.setup({
            defaults = {
                mappings = {
                    i = {
                        ["<ESC>"] = actions.close,
                        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                    }
                }
            }
        })

        telescope.load_extension("fzf")

        local k = vim.keymap

        k.set("n", "<leader>ff", builtin.find_files, { desc = "File", })
        k.set("n", "<leader>fh", builtin.help_tags, { desc = "Help", })
        k.set("n", "<leader>fr", builtin.resume, { desc = "Resume", })
        k.set("n", "<leader>fs", builtin.grep_string, { desc = "String", })
        k.set("n", "<leader>fw", function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end, { desc = "Word", })
    end,
}
