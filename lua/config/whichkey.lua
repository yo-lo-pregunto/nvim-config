local status_ok, wk = pcall(require, "which-key")
if not status_ok then
    return
end

local opts = {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local setup = {
    plugins = {
        marks = true, -- shows a list of your marks on ' and `
        registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        spelling = {
            enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
            suggestions = 20, -- how many suggestions should be shown in the list?
        },
        -- the presets plugin, adds help for a bunch of default keybindings in Neovim
        -- No actual key bindings are created
        presets = {
            operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
            motions = true, -- adds help for motions
            text_objects = true, -- help for text objects triggered after entering an operator
            windows = true, -- default bindings on <c-w>
            nav = true, -- misc bindings to work with windows
            z = true, -- bindings for folds, spelling and others prefixed with z
            g = true, -- bindings for prefixed with g
        },
    },
    -- add operators that will trigger motion and text object completion
    -- to enable all native operators, set the preset / operators plugin above
    operators = { gc = "Comments" },
    key_labels = {
        -- override the label used to display some keys. It doesn't effect WK in any other way.
        -- For example:
        -- ["<space>"] = "SPC",
        -- ["<cr>"] = "RET",
        -- ["<tab>"] = "TAB",
    },
    icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "➜", -- symbol used between a key and it's label
        group = "+", -- symbol prepended to a group
    },
    popup_mappings = {
        scroll_down = '<c-d>', -- binding to scroll down inside the popup
        scroll_up = '<c-u>', -- binding to scroll up inside the popup
    },
    window = {
        border = "none", -- none, single, double, shadow
        position = "bottom", -- bottom, top
        margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
        padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
        winblend = 0
    },
    layout = {
        height = { min = 4, max = 25 }, -- min and max height of the columns
        width = { min = 20, max = 50 }, -- min and max width of the columns
        spacing = 3, -- spacing between columns
        align = "left", -- align columns left, center or right
    },
    ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
    hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "}, -- hide mapping boilerplate
    show_help = true, -- show help message on the command line when the popup is visible
    show_keys = true, -- show the currently pressed key and its label as a message in the command line
    triggers = "auto", -- automatically setup triggers
    -- triggers = {"<leader>"} -- or specify a list manually
    triggers_blacklist = {
        -- list of mode / prefixes that should never be hooked by WhichKey
        -- this is mostly relevant for key maps that start with a native binding
        -- most people should not need to change this
        i = { "j", "k" },
        v = { "j", "k" },
    },
    -- disable the WhichKey popup for certain buf types and file types.
    -- Disabled by deafult for Telescope
    disable = {
        buftypes = {},
        filetypes = { "TelescopePrompt" },
    },
}

-- local mappings = {
--     ['e'] = {"<cmd>NvimTreeToggle<CR>l", "Explorer"},
--     ['g'] = {
--         name = "git",
--         b = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
--         d = { "<cmd>Gitsigns diffthis HEAD<cr>", "Git Diff", },
--         j = { "<cmd>lua require 'gitsigns'.next_hunk({navigation_message = false})<cr>", "Next Hunk" },
--         k = { "<cmd>lua require 'gitsigns'.prev_hunk({navigation_message = false})<cr>", "Prev Hunk" },
--         p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
--         r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
--         R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
--         s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
--         u = { "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", "Undo Stage Hunk", },
--     },
--     ['t'] = {
--         name = "Terminal",
--         j = {"<cmd>FloatermNext<cr>", "Next"},
--         k = {"<cmd>FloatermPrev<cr>", "Previous"},
--         n = {"<cmd>FloatermNew<cr>", "New"},
--         o = {"<cmd>Floatermtoggle<cr>", "toggle"},
--     }
-- }

local mappings = {
    ['c'] = { "<cmd>BufferKill<cr>", "Close Buffer" },
    ['d'] = {
        name = 'Do',
        a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
        s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
    },
    ['e'] = { "<cmd>NvimTreeToggle<CR>l", "Explorer" },
    ['f'] = { "<cmd>lua vim.lsp.buf.format({async = true})<cr>", "Format" },
    ['j'] = {
        name = 'Next',
        b = { "<cmd>bnext<cr>", "Buffer" },
        d = { vim.diagnostic.goto_next, "Diagnostic" },
        h = { "<cmd>lua require 'gitsigns'.next_hunk({navigation_message = false})<cr>", "Hunk" },
        t = { "<cmd>FloatermNext<cr>", "Terminal" },
    },
    ['k'] = {
        name = 'Previous',
        b = { "<cmd>bprevious<cr>", "Buffer" },
        d = { vim.diagnostic.goto_prev, "Diagnostic" },
        h = { "<cmd>lua require 'gitsigns'.prev_hunk({navigation_message = false})<cr>", "Hunk" },
        t = { "<cmd>FloatermPrev<cr>", "Terminal" },
    },
    ['o'] = {
        name = 'Open',
        d = { vim.diagnostic.setloclist, "Diagnostic" },
        m = { "<cmd>Mason<cr>", "Mason" },
        t = { "<cmd>FloatermNew<cr>", "Terminal" },
    },
    ['s'] = {
        name = 'Search',
        b = { "<cmd>Telescope buffers<cr>", "Buffer" },
        c = { "<cmd>Telescope colorscheme<cr>", "ColorScheme" },
        f = { "<cmd>Telescope find_files<cr>", "Files" },
        g = { "<cmd>lua require('telescope.builtin').grep_string({ search = vim.fn.input('Grep > ') })<cr>", "Rg Search" },
        h = { "<cmd>Telescope help_tags<cr>", "Help"},
        t = { "<cmd>Telescope tags<cr>", "Tags" },
        w = { "<cmd>lua require'telescope.builtin'.grep_string(require'telescope.themes'.get_cursor({layout_config={width=0.6, height=0.3, preview_width=0.7}}))<cr>", "Word"}
    },
    ['t'] = { "<cmd>FloatermToggle<cr>", "Toggle Terminal" },
    ['u'] = {
        name = 'Undo',
        b = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Buffer" },
        h = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Hunk" },
        n = { vim.lsp.buf.rename, "Rename" },
        s = { "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", "Stage Hunk", },
    },
    ['v'] = {
        name = 'View',
        b = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
        d = { vim.diagnostic.open_float, "Diagnostic" },
        D = { "<CMD>Gitsigns diffthis HEAD<CR>", " Git Diff", },
        l = { "<cmd>LspInfo<cr>", "LSP Info" },
        p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Hunk Preview" },
    },
    ['w'] = { "<cmd>w!<cr>", "Write Buffer" },
    ['q'] = { "<cmd>q<cr>", "Quite" }
}

wk.setup(setup)
wk.register(mappings, opts)
