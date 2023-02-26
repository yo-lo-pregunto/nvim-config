-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

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
end)
