return {
    'ThePrimeagen/harpoon',
    keys = function()
        local mark = require("harpoon.mark")
        local ui = require("harpoon.ui")

        -- vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)
        return {
            { "<leader>;a", mark.add_file, desc = "Add" },
            { "<leader>;e", ui.toggle_quick_menu, desc = "View" },
            { "<leader>;j", function() ui.nav_file(1) end, desc = "Buf 1" },
            { "<leader>;k", function() ui.nav_file(2) end, desc = "Buf 2" },
            { "<leader>;l", function() ui.nav_file(3) end, desc = "Buf 3" },
            { "<leader>;;", function() ui.nav_file(3) end, desc = "Buf 4" },
        }
    end,
}
