require('nightfox').setup({
    options = {
        transparent = true,
        styles = {
            comments = 'italic',
            types = 'italic,bold',
        }
    }
})

vim.cmd('colorscheme nightfox')
