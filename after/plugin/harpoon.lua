local mark = require("harpoon.mark")
local ui = require("harpoon.ui")
local wk = require("which-key")
local opts = require("yo-lo-pregunto.utils")

wk.register({
    ["a"] = { mark.add_file, "Add file" },
    ["<S-E>"] = { ui.toggle_quick_menu, "Harpoon Menu" },
    ["<Tab>"]  = { ui.nav_next, "Harpoon Next" },
    ["<S-Tab>"]  = { ui.nav_prev, "Harpoon Prev" },
}, opts.remap_opts)
