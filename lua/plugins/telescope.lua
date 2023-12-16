local build_str = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build"

return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.5",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        { "nvim-telescope/telescope-fzf-native.nvim", build = build_str },
    },
    config = function(_, opts)
        local telescope = require("telescope")
        local actions = require("telescope.actions")
        local builtin = require("telescope.builtin")

        telescope.setup({
            defaults = {
                layout_strategy = "horizontal",
                layout_config =  { preview_width = 0.6 },
                mappings = {
                    i = {
                        ["<ESC>"] = actions.close,
                        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                        ["<RightMouse>"] = actions.close,
                        ["<LeftMouse>"] = actions.select_default,
                        ["<ScrollWheelDown>"] = actions.move_selection_next,
                        ["<ScrollWheelUp>"] = actions.move_selection_previous,
                    }
                },
            },
            pickers = {
                live_grep = {
                    theme = "ivy",
                },
            }
        })

        telescope.load_extension("fzf")

        local function telescope_live_grep_open_files()
            require('telescope.builtin').live_grep({
                grep_open_files = true,
                prompt_title = 'Live Grep in Open Files',
            })
        end


        local ivy = require('telescope.themes').get_ivy()
        vim.keymap.set('n', '<leader>s/', function() telescope_live_grep_open_files(ivy) end, { desc = '[S]earch [/] in Open Files' })
        vim.keymap.set("n", "<leader>sf", function() builtin.find_files(ivy) end, { desc = "File", })
        vim.keymap.set("n", "<leader>sh", function() builtin.help_tags(ivy) end, { desc = "Help", })
        vim.keymap.set("n", "<leader>sr", function() builtin.resume(ivy) end, { desc = "Resume", })
        vim.keymap.set("n", "<leader>sw", function() builtin.grep_string(ivy) end, { desc = "word", })
        vim.keymap.set("n", "<leader>sj", function() builtin.jumplist(ivy) end, { desc= "Jumps" })
        vim.keymap.set("n", "<leader>sg", function()
            builtin.grep_string(ivy, { search = vim.fn.input("Grep > ") })
        end, { desc = "Grep", })
    end,
}
