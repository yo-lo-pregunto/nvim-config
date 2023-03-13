local opts = { noremap = true, silent = true }

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set({"n", "v"}, "<leader>y", [["+y]], { desc = "SysClipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "SysClipboard" })

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]], { desc = "Null Delete" })

vim.keymap.set("n", "<leader>w", "<cmd>w!<cr>", { desc = "Save" })
vim.keymap.set("n", "<leader>q", "<cmd>q<cr>", {desc = "quit" })

vim.keymap.set("i",  "kj", "<ESC>",opts)

-- Resize with arrows
vim.keymap.set("n", "<C-Up>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", opts)
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Terminal
vim.keymap.set("t",  "kj", "<C-\\><C-N>",opts)
