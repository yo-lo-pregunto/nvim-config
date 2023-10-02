local M = {}

require("yo-lo-pregunto.lsp.core.diagnostic")

local function merge(a, b)
    for k, v in pairs(b) do
       a[k] = v
    end
end

merge(M, require("yo-lo-pregunto.lsp.lua"))
merge(M, require("yo-lo-pregunto.lsp.c"))
merge(M, require("yo-lo-pregunto.lsp.rust"))
merge(M, require("yo-lo-pregunto.lsp.python"))
merge(M, require("yo-lo-pregunto.lsp.latex"))
merge(M, require("yo-lo-pregunto.lsp.cmake"))
merge(M, require("yo-lo-pregunto.lsp.bash"))
return M
