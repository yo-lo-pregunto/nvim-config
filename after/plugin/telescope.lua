local builtin = require('telescope.builtin')
local wk = require("which-key")
local opts = require("yo-lo-pregunto.utils")

wk.register({
    ['s'] = {
        name = "Search",
        ['f'] = { builtin.find_files, "File" },
        ['g'] = { builtin.git_files, "Git Files" },
        ['h'] = { builtin.help_tags, "Help" },
        ['b'] = { builtin.buffers, "Buffers" },
        ['w'] = { function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end, "Word" }
    }
}, opts.remap_opts)
