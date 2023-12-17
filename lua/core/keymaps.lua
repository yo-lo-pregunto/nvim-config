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

-- Save and quit
k.set("n", "<leader>w", "<cmd>w!<cr>", { desc = "Save" })
k.set("n", "<leader>q", "<cmd>q<cr>", { desc = "Quit" })

-- Clipboard
k.set("x", "<leader>p", [["_dP]])

k.set({"n", "v"}, "<leader>y", [["+y]], { desc = "SysClipboard" })
k.set("n", "<leader>Y", [["+Y]], { desc = "SysClipboard" })

k.set({"n", "v"}, "<leader>d", [["_d]], { desc = "Null Delete" })

-- Exit insert mode
k.set("i", "kj", "<ESC>", { desc = "Exit insert mode" })
k.set("t", "KJ", "<C-\\><C-N>", { desc = "Exit insert mode" })

-- Terminal --
k.set("t", "<C-h>", "<C-\\><C-N><C-w>h", { silent = true })
k.set("t", "<C-j>", "<C-\\><C-N><C-w>j", { silent = true })
k.set("t", "<C-k>", "<C-\\><C-N><C-w>k", { silent = true })
k.set("t", "<C-l>", "<C-\\><C-N><C-w>l", { silent = true })
