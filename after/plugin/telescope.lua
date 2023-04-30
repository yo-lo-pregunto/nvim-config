local actions = require('telescope.actions')
require('telescope').setup({
        mappings = {
            i = {
                ["<esc>"] = actions.close,
                ["<RightMouse>"] = actions.close,
                ["<LeftMouse>"] = actions.select_default,
                ["<ScrollWheelDown>"] = actions.move_selection_next,
                ["<ScrollWheelUp>"] = actions.move_selection_previous,
            }
        },
})
