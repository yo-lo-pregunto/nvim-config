vim.g.tmux_navigator_no_mappings = 1

local opts = { noremap = true, silent = true }

local keymap = vim.api.nvim_set_keymap

keymap("n", "<A-h>", ":<C-U>TmuxNavigateLeft<cr>", opts)
keymap("n", "<A-j>", ":<C-U>TmuxNavigateDown<cr>", opts)
keymap("n", "<A-k>", ":<C-U>TmuxNavigateUp<cr>", opts)
keymap("n", "<A-l>", ":<C-U>TmuxNavigateRight<cr>", opts)
