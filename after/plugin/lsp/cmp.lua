local cmp = require('cmp')
local luasnip = require('luasnip')

local kind_icons = {
  Text = "",
  Method = "",
  Function = "",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "ﴯ",
  Interface = "",
  Module = "",
  Property = "ﰠ",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = ""
}

local merge = function(a, b)
  return vim.tbl_deep_extend('force', {}, a, b)
end

local function check_back_space ()
	local col = vim.fn.col('.') - 1
	if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
		return true
	else
		return false
	end
end

cmp.setup({
	view = {
		entries = {name = 'custom', selection_order = 'near_cursor' } 
	},
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end
	},
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'nvim_lua' },
		{ name = 'luasnip' },
	}, {
		{ name = 'buffer' },
		{ name = 'path' },
	}),
	mapping = cmp.mapping.preset.insert({
		-- confirm selection
    		['<CR>'] = cmp.mapping.confirm({select = false}),
    		['<C-y>'] = cmp.mapping.confirm({select = false}),

    		-- navigate items on the list
    		['<Up>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
    		['<Down>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),

		-- scroll up and down in the completion documentation
		['<C-b>'] = cmp.mapping.scroll_docs(-5),
		['<C-f>'] = cmp.mapping.scroll_docs(5),

		-- toggle completion
		['<C-space>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.abort()
			else
				cmp.complete()
			end
		end),
		-- when menu is visible, navigate to next item
		-- when line is empty, insert a tab character
		-- else, activate completion
		['<Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item({ cmp.SelectBehavior.Select })
			elseif check_back_space() then
				fallback()
			else
				cmp.complete()
			end
		end, {'i', 's'}),

		-- when menu is visible, navigate to previous item on list
		-- else, revert to default behavior
		['<S-Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item({ cmp.SelectBehavior.Select })
			else
				fallback()
			end
		end, {'i', 's'}),
        -- go to next placeholder in the snippet
        ['<C-n>'] = cmp.mapping(function(fallback)
            if luasnip.jumpable(1) then
                luasnip.jump(1)
            else
                fallback()
            end
        end, {'i', 's'}),
        -- go to previous placeholder in the snippet
        ['<C-p>'] = cmp.mapping(function(fallback)
            if luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, {'i', 's'})
	}),
	formatting = {
		fields = { 'kind', 'abbr', 'menu' },
		format = function(entry, vim_item)
			-- Kind icons
			vim_item.kind = kind_icons[vim_item.kind] or ""
			vim_item.menu = ({
				buffer = "[Buffer]",
				nvim_lsp = "[LSP]",
				luasnip = "[LuaSnip]",
				nvim_lua = "[nvim]",
				latex_symbols = "[LaTeX]",
			})[entry.source.name]
			return vim_item
		end
	},
	window = {
		documentation = merge(
		cmp.config.window.bordered(),
		{
			max_height = 15,
			max_width = 60,
		})
	}
})
