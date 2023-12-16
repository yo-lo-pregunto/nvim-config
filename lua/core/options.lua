local opt = vim.opt

-- Line
opt.number = true -- Show number
opt.relativenumber = true -- Show absolute line number on cursor line

opt.wrap = false -- Disable line wrapping

opt.cursorline = true -- Highlight the current cursor line
opt.colorcolumn = "80" -- Show vertical line

-- Tabs & indentation
opt.expandtab = true -- Expand tab for spaces
opt.tabstop = 4 -- 4 spaces per tab
opt.shiftwidth = 4 -- Uses 4 spaces when indent
opt.autoindent = true -- Copy indent from current line when stargin new one

-- Search
opt.ignorecase = true -- Ignore case when searching
opt.smartcase = true -- If you include mixed case in your search, assumes you want case-sensitive
opt.incsearch = true -- Show you live match. Not recommended on slow computers.

opt.virtualedit = 'block' -- When Visual Block uses cells
opt.inccommand = 'split' -- Show a quickfix list with live changes

-- Appereance
opt.termguicolors = true -- Nee a true color terminal
opt.background = "dark" -- Colorschemes that can be light or dark will be set to dark
opt.signcolumn = "yes" -- Show sign column so that text doesn't shift
opt.conceallevel = 2 -- Latex require for fancy fonts

-- Scroll
opt.scrolloff = 8 -- Have at least 8 lines above or below the cursor

-- Splits
opt.splitright = true -- Split vertical window to the right
opt.splitbelow = true -- Split horizontal window to the bottom

opt.updatetime = 50

opt.swapfile = false
opt.backup = false

opt.pumheight = 7 -- Numer of items in popup menu

opt.list = true -- Show tabs if any
