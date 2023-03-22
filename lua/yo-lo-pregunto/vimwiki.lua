local wiki = {
    path = "~/vimwiki",
    nested_syntaxes = {
        python = "python",
        ['c++'] = 'cpp',
        c = 'c',
        rust = 'rs'
    }
}

vim.g.vimwiki_list = wiki
