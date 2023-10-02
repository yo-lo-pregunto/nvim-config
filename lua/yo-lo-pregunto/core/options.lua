local opt = vim.opt

-- Line number
opt.number = true -- Show relative line
opt.relativenumber = true -- Show absolute line number on cursor line (when relative number is on)

-- Tabs & indentation
opt.tabstop = 4 -- 4 spaces for tabs
opt.shiftwidth = 4 -- 4 spaces for indent width
opt.expandtab = true -- Expand tab to spaces
opt.autoindent = true -- Copy indent from current line when starting new one

-- Line wrap
opt.wrap = false -- Disable line wrapping

opt.ignorecase = true -- Ignore case when searching
opt.smartcase = true -- If you include mixed case in your search, assumes you want case-sensitive
opt.incsearch = true -- Show you live match. Not recommended on slow computers.

-- cursor line
opt.cursorline = true -- Highlight the current cursor line
opt.colorcolumn = "80" -- Show vertical line
opt.guicursor = "" -- Cursor set to block

-- Appereance
opt.termguicolors = true -- Nee a true color terminal
opt.background = "dark" -- Colorschemes that can be light or dark will be set to dark
opt.signcolumn = "yes" -- Show sign column so that text doesn't shift
opt.conceallevel = 2 -- Latex require for fancy fonts

-- Backspace
opt.backspace = "indent,eol,start"

-- Scroll
opt.scrolloff = 8 -- Have at least 8 lines above or below the cursor

-- Splits
opt.splitright = true -- Split vertical window to the right

opt.updatetime = 50

opt.swapfile = false
opt.backup = false

opt.mouse = ""

opt.pumheight = 7 -- Numer of items in popup menu
