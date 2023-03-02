require("which-key").setup({
    window = {
        border = "single",
    },
    disable = {
        filetypes = { "TelescopePrompt" }
    },
})

require("which-key").register({
     ['c'] = {
         name = 'CMake',
         ['g'] = { "<cmd>CMakeGenerate<cr>", "Generate" },
         ['q'] = { "<cmd>CMakeClose<cr>", "Close" },
     }
}, require("yo-lo-pregunto.utils").remap_opts)
