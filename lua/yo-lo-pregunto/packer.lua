-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

-- Automatically install packer
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = vim.fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Have packer use a popup window
packer = require('packer')
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Telescope
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- Themes
    use ({
        "EdenEast/nightfox.nvim",
        config = function()
            vim.cmd('colorscheme nightfox')
        end
    })
    -- Treesiter / Syntax highliter
    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate' })
    use('nvim-treesitter/playground')

    -- Harpoon
    use('ThePrimeagen/harpoon')

    -- LSP
    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    }

    -- AutoCompletion
    use({'hrsh7th/nvim-cmp'})
    use({'hrsh7th/cmp-nvim-lsp'})
    use({'hrsh7th/cmp-buffer'})
    use({'hrsh7th/cmp-path'})
    use({'saadparwaiz1/cmp_luasnip'})
    use({'hrsh7th/cmp-nvim-lua'})

    -- Snippets
    use({'L3MON4D3/LuaSnip'})
    use({'rafamadriz/friendly-snippets'})

    -- Gitsigns
    use {
        'lewis6991/gitsigns.nvim',
        tag = 'v0.6'
    }

    -- Tmux
    use { 'christoomey/vim-tmux-navigator' }

    -- WhichKey
    use {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end
    }
end)
