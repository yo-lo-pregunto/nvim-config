return {
    "cdelledonne/vim-cmake",
    config = function()
        vim.g.cmake_link_compile_commands = 1
        vim.g.cmake_build_dir_location = './.nvim'
    end,
    keys = {
        { "<leader>cg", "<cmd>CMakeGenerate<cr>", { desc = "Generate" } },
        { "<leader>cq", "<cmd>CMakeClose<cr>", { desc = "Close" } },
    }
}
