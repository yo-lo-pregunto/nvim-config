return {
    'ThePrimeagen/harpoon',
    keys = function()
        local mark = require("harpoon.mark")
        local ui = require("harpoon.ui")

        return {
            { "<leader>ha", mark.add_file, desc = "Add" },
            { "<leader>he", ui.toggle_quick_menu, desc = "View" },
            { "<leader>hj", function() ui.nav_file(1) end, desc = "Buf 1" },
            { "<leader>hk", function() ui.nav_file(2) end, desc = "Buf 2" },
            { "<leader>hl", function() ui.nav_file(3) end, desc = "Buf 3" },
            { "<leader>h;", function() ui.nav_file(3) end, desc = "Buf 4" },
        }
    end,
}
