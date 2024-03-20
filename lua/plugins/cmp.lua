return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        "hrsh7th/cmp-buffer", -- source for text in buffer
        "hrsh7th/cmp-path", -- source for file system paths
        "hrsh7th/cmp-nvim-lsp", -- adds LSP completion capabilities
        "saadparwaiz1/cmp_luasnip", -- for autocompletion
        "L3MON4D3/LuaSnip", -- snippet engine
        "rafamadriz/friendly-snippets", -- useful snippets
        "onsails/lspkind.nvim", -- vs-code like pictograms
        "hrsh7th/cmp-nvim-lsp-signature-help",
        "f3fora/cmp-spell",
        "kdheepak/cmp-latex-symbols",
    },
    config = function()

        local merge = function(a, b)
            return vim.tbl_deep_extend('force', {}, a, b)
        end

        local cmp = require("cmp")
        local luasnip = require("luasnip")
        local lspkind = require("lspkind")

        require("luasnip.loaders.from_vscode").lazy_load()

        cmp.setup({
            snippet = { -- configure how nvim-cmp interacts with snippet engine
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                -- confirm selection
                ['<C-j>'] = cmp.mapping.confirm({ select = true}),
                -- Toggle completion
                ["<C-i>"] = cmp.mapping(function(_)
                    if cmp.visible() then
                        cmp.abort()
                    else
                        cmp.complete()
                    end
                end),

                -- scroll up and down in the completion documentation
                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),

                -- Select the next or previous item
                ['<C-n>'] = cmp.mapping.select_next_item(),
                ['<C-p>'] = cmp.mapping.select_prev_item(),

                ['<C-l>'] = cmp.mapping(function()
                    if luasnip.expand_or_locally_jumpable() then
                        luasnip.expand_or_jump()
                    end
                end, { 'i', 's' }),
                ['<C-h>'] = cmp.mapping(function()
                    if luasnip.locally_jumpable(-1) then
                        luasnip.jump(-1)
                    end
                end, { 'i', 's' }),

            }),
            -- sources for autocompletion
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "nvim_lsp_signature_help"},
                { name = "luasnip" }, -- snippets
                { name = "buffer" }, -- text within current buffer
                { name = "path" }, -- file system paths
                { name = "vimtex" }, -- file system paths
                { name = "spell", keyword_length = 4, option = {
                    keep_all_entries = false,
                    enable_in_contex = function ()
                        return true
                    end
                }},
                {
                    name = "latex_symbols",
                    option = {
                        strategy = 0, -- mixed
                    },
                },
            }),
            -- configure lspkind for vs-code like pictograms in completion menu
            formatting = {
                format = lspkind.cmp_format({
                    maxwidth = 50,
                    ellipsis_char = "...",
                }),
            },
            window = {
                documentation = merge(cmp.config.window.bordered(),
                    {
                        max_height = 20,
                        max_width = 60,
                    }),
                completion = cmp.config.window.bordered(),
            },
            experimental = {
                ghost_text = { hl_group = "Comments" },
            },
        })
    end,
}
