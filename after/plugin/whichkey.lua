require("which-key").setup({
    window = {
        border = "single",
    },
    disable = {
        filetypes = { "TelescopePrompt" }
    },
})

local t_builtin = require('telescope.builtin')
require("which-key").register({
     ['c'] = { -- Cmake
         name = 'CMake',
         ['g'] = { "<cmd>CMakeGenerate<cr>", "Generate" },
         ['q'] = { "<cmd>CMakeClose<cr>", "Close" },
     },
    ['e'] = { "<cmd>NvimTreeToggle<cr>", "Explorer" }, -- NvimTree
    ['f'] = { -- Telescope
        name = "Find",
        ['b'] = { t_builtin.buffers, "Buffers" },
        ['f'] = { t_builtin.find_files, "File" },
        ['g'] = { t_builtin.git_files, "Git Files" },
        ['h'] = { t_builtin.help_tags, "Help" },
        ['r'] = { t_builtin.resume, "Help" },
        ['w'] = { function()
            t_builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end, "Word" }
    },
    ['g'] = {
        name = 'Git',

    },
    ['l'] = {
        name = "LSP",
        ['i'] = { "<cmd>LspInfo<cr>", "Info" },
        ['m'] = { "<cmd>Mason<cr>", "Mason Info" },
    },
    ['t'] =  { "<cmd>ToggleTerm<cr>", "Terminal" },
}, require("yo-lo-pregunto.utils").remap_opts)
