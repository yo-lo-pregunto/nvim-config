vim.g.mapleader = " "

local k = vim.keymap

-- Move current line up(K) or down(J)
k.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
k.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up" })

-- Place cursor always at the middle
k.set("n", "<C-d>", "<C-d>zz")
k.set("n", "<C-u>", "<C-u>zz")
k.set("n", "n", "nzzzv")
k.set("n", "N", "Nzzzv")

-- File Explorer
k.set("n", "<leader>e", vim.cmd.Ex, { desc = "File Explorer" })

-- Save and quit
k.set("n", "<leader>s", "<cmd>w!<cr>", { desc = "Save" })
k.set("n", "<leader>q", "<cmd>q<cr>", { desc = "Quit" })

-- Clipboard
k.set("x", "<leader>p", [["_dP]])

k.set({"n", "v"}, "<leader>y", [["+y]], { desc = "SysClipboard" })
k.set("n", "<leader>Y", [["+Y]], { desc = "SysClipboard" })

k.set({"n", "v"}, "<leader>d", [["_d]], { desc = "Null Delete" })

-- Exit insert mode
k.set("i", "kj", "<ESC>", { desc = "Exit insert mode" })
k.set("t", "KJ", "<C-\\><C-N>", { desc = "Exit insert mode" })
