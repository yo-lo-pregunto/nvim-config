local build_str = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build"

return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.5",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        { "nvim-telescope/telescope-fzf-native.nvim", build = build_str },
    },
    config = function(_, _) -- params: plugin, opts
        local telescope = require("telescope")
        local actions = require("telescope.actions")

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
    end,
    keys = function()
        local builtin = require("telescope.builtin")
        local ivy = require('telescope.themes').get_ivy()

        local function telescope_live_grep_open_files()
            require('telescope.builtin').live_grep({
                grep_open_files = true,
                prompt_title = 'Live Grep in Open Files',
            })
        end

        return {
            { "<leader>s/", function() telescope_live_grep_open_files() end, desc = 'Open Files' },
            { "<leader>sf", function() builtin.find_files(ivy) end, desc = "File", },
            { "<leader>sh", function() builtin.help_tags(ivy) end, desc = "Help", },
            { "<leader>sr", function() builtin.resume(ivy) end, desc = "Resume", },
            { "<leader>sw", function() builtin.grep_string(ivy) end, desc = "word" },
            { "<leader>sj", function() builtin.jumplist(ivy) end, desc= "Jumps" },
            { "<leader>sg", function()
                builtin.grep_string({ search = vim.fn.input("Grep > ") })
            end, desc = "Grep" }
        }
    end,
}
