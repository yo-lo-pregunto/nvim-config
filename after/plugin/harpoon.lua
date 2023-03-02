local mark = require("harpoon.mark")
local ui = require("harpoon.ui")
local wk = require("which-key")
local opts = require("yo-lo-pregunto.utils")

wk.register({
    ["a"] = { mark.add_file, "Add file" },
    ["<S-E>"] = { ui.toggle_quick_menu, "Harpoon Menu" },
    ["<S-l>"]  = { ui.nav_next, "Harpoon Next" },
    ["<S-h>"]  = { ui.nav_prev, "Harpoon Prev" },
}, opts.remap_opts)
