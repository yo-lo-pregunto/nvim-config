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
        b = { "<cmd>bnext", "Buffer" },
        d = { vim.diagnostic.goto_next, "Diagnostic" },
        h = { "<cmd>lua require 'gitsigns'.next_hunk({navigation_message = false})<cr>", "Hunk" },
        t = { "<cmd>FloatermNext<cr>", "Terminal" },
    },
    ['k'] = {
        name = 'Previous',
        b = { "<cmd>bprevious", "Buffer" },
        d = { vim.diagnostic.goto_prev, "Diagnostic" },
        h = { "<cmd>lua require 'gitsigns'.prev_hunk({navigation_message = false})<cr>", "Hunk" },
        t = { "<cmd>FloatermPrev<cr>", "Terminal" },
    },
    ['o'] = {
        name = 'Open',
        d = { vim.diagnostic.setloclist, "Diagnostic" },
        m = { "<cmd>Mason", "Mason" },
        t = { "<cmd>FloatermNew<cr>", "Terminal" },
    },
    ['s'] = {
        name = 'Search',
        b = { "<cmd>Buffers<cr>", "Buffer" },
        c = { "<cmd>Colors<cr>", "ColorScheme" },
        f = { "<cmd>Files<cr>", "Files" },
        t = { "<cmd>Tags<cr>", "Tags" },
        w = { "<cmd>Rg", "Word" }
    },
    ['t'] = { "<cmd>Floatermtoggle<cr>", "Toggle Terminal" },
    ['u'] = {
        name = 'Undo',
        b = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Buffer" },
        h = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Hunk" },
        r = { vim.lsp.buf.rename, "Rename" },
        s = { "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", "Stage Hunk", },
    },
    ['v'] = {
        name = 'View',
        b = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
        d = { vim.diagnostic.open_float, "Diagnostic" },
        D = { "<CMD>GITSIGNS DIFFTHIS HEAD<CR>", " Git Diff", },
        l = { "<cmd>LspInfo<cr>", "LSP Info" },
        p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Hunk Preview" },
    },
    ['w'] = { "<cmd>w!<cr>", "Write Buffer" }
}

return mappings
