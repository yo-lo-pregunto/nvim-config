return {
    "tpope/vim-fugitive",
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup({
                on_attach = function(bufnr)
                    local gs = package.loaded.gitsigns
                    local opts = { noremap = true, silent = true, buffer = bufnr }
                    local k = vim.keymap

                    opts.desc = "Stage hunk"
                    k.set("n", "<leader>gs", gs.stage_hunk, opts)

                    opts.desc = "Reset hunk"
                    k.set("n", "<leader>gr", gs.reset_hunk, opts)

                    opts.desc = "Undo hunk"
                    k.set("n", "<leader>gS", gs.undo_stage_hunk, opts)

                    opts.desc = "Stage buffer"
                    k.set("n", "<leader>gR", gs.stage_buffer, opts)

                    opts.desc = "Reset buffer"
                    k.set("n", "<leader>gu", gs.stage_buffer, opts)

                    opts.desc = "Preview hunk"
                    k.set("n", "<leader>gp", gs.preview_hunk, opts)

                    opts.desc = "Status"
                    k.set("n", "<leader>gg", "<cmd>G<cr>", opts)

                    opts.desc = "Next"
                    k.set("n", "]c", function ()
                        if vim.wo.diff then return ']c' end
                        vim.schedule(function() gs.next_hunk() end)
                        return '<Ignore>'
                    end, opts)

                    opts.desc = "Previous"
                    k.set("n", "[c", function ()
                        if vim.wo.diff then return '[c' end
                        vim.schedule(function() gs.prev_hunk() end)
                        return '<Ignore>'
                    end, opts)
                end,
            })
        end,
    }
}
