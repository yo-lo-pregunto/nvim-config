local options = {
    backup = false,             -- create a backup file
    clipboard = "unnamedplus",	-- allows neovim to access the system clipboard
    cmdheight = 2,              -- more space in the nvim command line for displaying messages
    fileencoding = "utf-8",
    hlsearch = false,	        -- highlight all matches on previous search patterm
    ignorecase = true,	        -- ignore case in search patterns
    mouse = "a",                -- allow the mouse to be used in nvim
    smartcase = true,           -- smart case
    splitbelow = true,	        -- horizontal splits go to below window
    splitright = true,	        -- vertical splits go to right window
    termguicolors = true,	    -- fancy colors
    timeoutlen = 400,	        -- time to wait for a mapped sequence to complete
    updatetime = 300,	        -- faster completion 
    expandtab = true,	        -- conver tabs to space
    tabstop = 4,		        -- inset 4 spaces for a tab
    softtabstop = 4,	        -- when hitting <BS>, pretend like tab is removed, even if spaces 
    shiftwidth = 4, 	        -- number of space used for auto indent
    shiftround = true, 	        -- use multiples of shiftwidth when indent
    cursorline = true,	        -- highlight the current line
    number = true,		        -- set numbered lines
    relativenumber = true,      -- set relative number
    signcolumn = "yes",         -- always show column numbers
    wrap = false,               -- display lines as one long line
    guifont = "monospace:h17",  -- the font used in graphical nvim
    autoindent = true,          -- audoindent
    hidden = true,
    scrolloff = 8
}

for k, v in pairs(options) do
	vim.opt[k] = v
end
