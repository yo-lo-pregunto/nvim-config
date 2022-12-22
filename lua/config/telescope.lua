local actions = require('telescope.actions')
require('telescope').setup({
    defaults = {
        layout_strategy = 'vertical',
        layout_config = {
            prompt_position = "top",
            height = 0.8,
            width = 0.5,
        },
        mappings = {
            i = {
                ["<esc>"] = actions.close,

                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,

                ["<C-n>"] = false,
                ["<C-p>"] = false,
            }
        },
    },
})
