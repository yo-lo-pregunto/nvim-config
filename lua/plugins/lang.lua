return {
    -- For Python
    {
        'linux-cultist/venv-selector.nvim',
        dependencies = { 'neovim/nvim-lspconfig', 'nvim-telescope/telescope.nvim', },
        opts = {
            anaconda_envs_path = "/Users/yo-lo-pregunto/miniconda3/envs",
        },
        ft = "python",
        keys = {
            -- Keymap to open VenvSelector to pick a venv.
            { '<leader>vs', '<cmd>VenvSelect<cr>' },
            -- Keymap to retrieve the venv from a cache (the one previously used for the same project directory).
            { '<leader>vc', '<cmd>VenvSelectCached<cr>' },
        },
    },
    -- For C
    {
        'cdelledonne/vim-cmake',
        config = function ()
            vim.g["cmake_link_compile_commands"] = 1
            vim.g["cmake_default_config"] = ".nvim"
        end,
        keys = {
            { "<leader>cg", "<cmd>CMakeGenerate<CR>", { desc = "Generate" } },
            { "<leader>cq", "<cmd>CMakeClose<CR>", { desc = "Close" } },
        },
        ft = { "c", "cpp" },
    }
}
