vim.cmd([[
    let wiki = {}
    let wiki.path = '~/vimwiki'
    let wiki.nested_syntaxes = {'python': 'python', 'c++': 'cpp', 'c': 'c', 'rust': 'rust' }
    let g:vimwiki_list = [wiki]
]])
