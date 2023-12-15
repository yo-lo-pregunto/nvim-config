return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = true,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    opts = {
        actions = {
            open_file = {
                quit_on_open = true,
            },
        },
    },
    config = true,
    keys = {
        { "<leader>e", "<cmd>NvimTreeToggle<cr>", { desc = "Explorer" } },
    }
}
