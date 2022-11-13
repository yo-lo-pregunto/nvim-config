local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<,>", "<Nop>", opts)
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<A-h>", "<C-w>h", opts)
keymap("n", "<A-j>", "<C-w>j", opts)
keymap("n", "<A-k>", "<C-w>k", opts)
keymap("n", "<A-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
-- keymap("n", "<leader>s", "<Esc>:m .+1<CR>==gi", opts)
-- keymap("n", "<leader>w", "<Esc>:m .-2<CR>==gi", opts)

-- Insert --
-- Press kj fast to exit insert mode 
keymap("i", "kj", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<S-j>", ":m .+1<CR>==", opts)
keymap("v", "<S-k>", ":m .-2<CR>==", opts)
-- keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("n", "X", "<C-v>", opts)
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<A-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<A-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<A-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<A-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Paste --
keymap("x", "<leader>p", "\"_dP", opts)

-- Plugins
keymap("n", "<leader>b", ":Buffers<cr>", opts)          -- fzf  search buffers
keymap("n", "<leader>c", ":bd<cr>", opts)               -- vim  close buffer
keymap("n", "<leader>gs", ":Gitsigns stage_hunk<cr>", opts)                 -- git  stage hunk
keymap("n", "<leader>gr", ":Gitsigns reset_hunk<cr>", opts)                 -- git  reset hunk
keymap("n", "<leader>gS", ":Gitsigns stage_buffer<cr>", opts)               -- git  stage buffer
keymap("n", "<leader>gR", ":Gitsigns reset_buffer<cr>", opts)               -- git  reset buffer
keymap("n", "<leader>gu", ":Gitsigns undo_stage_hunk<cr>", opts)            -- git  undo hunk
keymap("n", "<leader>gp", ":Gitsigns preview_hunk<cr>", opts)               -- git  preview hunk
keymap("n", "<leader>gb", ":Gitsigns toggle_current_line_blame<cr>", opts)  -- git  toggle blame
keymap("n", "<leader>gj", ":Gitsigns next_hunk<cr>", opts)                  -- git  next hunk
keymap("n", "<leader>gk", ":Gitsigns prev_hunk<cr>", opts)                  -- git  prev hunk
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)   -- exp  open file explorer
keymap("n", "<leader>f", ":Files<cr>", opts)            -- fzf  search files
keymap("n", "<leader>q", ":qa<cr>", opts)               -- vim  quit all
keymap("n", "<leader>s", ":Rg<cr>", opts)               -- fzf  search word in project
keymap("n", "<leader>t", ":FloatermToggle<cr>", opts)   -- term open terminal
keymap("n", "<leader>w", ":w<cr>", opts)                -- vim  save buffer
