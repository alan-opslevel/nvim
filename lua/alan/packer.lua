-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use('wbthomason/packer.nvim')


	-- telescope.nvim
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.2',
		-- or                            , branch = '0.1.x',
		requires = { { 'nvim-lua/plenary.nvim' } }
	}

	-- kanagawa.nvim
	use({
		'rebelot/kanagawa.nvim',
		as = 'kanagawa',
		config = function()
			vim.cmd('colorscheme kanagawa-dragon')
		end
	})

	-- treesitter.nvim
	use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })

	-- lualine.nvim
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'nvim-tree/nvim-web-devicons', opt = true }
	}

	-- undotree
	use('mbbill/undotree')

	-- t-pope
	use('tpope/vim-fugitive')
	use('tpope/vim-surround')
	use('tpope/vim-vinegar')
	use('tpope/vim-eunuch')
	use('tpope/vim-commentary')
	use('tpope/vim-rails')
	use('tpope/vim-endwise')
	use('tpope/vim-repeat')

	-- lsp-zero
	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		requires = {
			-- LSP Support
			{ 'neovim/nvim-lspconfig' }, -- Required
			{                         -- Optional
				'williamboman/mason.nvim',
				run = function()
					pcall(vim.api.nvim_command, 'MasonUpdate')
				end,
			},
			{ 'williamboman/mason-lspconfig.nvim' }, -- Optional

			-- Autocompletion
			{ 'hrsh7th/nvim-cmp' },  -- Required
			{ 'hrsh7th/cmp-nvim-lsp' }, -- Required
			{ 'L3MON4D3/LuaSnip' },  -- Required
		}
	}


	-- additional lang Support
	use('vim-ruby/vim-ruby')
	use('posva/vim-vue')
	use('fatih/vim-go', { run = ':GoUpdateBinaries' })

	-- to comment in vue or jsx where commenting differs between sections of the page
	use {
		'numToStr/Comment.nvim',
		config = function()
			require('Comment').setup()
		end
	}

	-- havent used yet
	-- use('lambdalisue/fern.vim')

	-- gitsigns
	use('lewis6991/gitsigns.nvim')


	-- QOL
	use {
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup()
		end
	}

	-- autotags
	use {
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup()
		end
	}


	use('haya14busa/is.vim')
	use('ap/vim-css-color')

	-- formatter.nvim
	use('mhartington/formatter.nvim')

	-- null-ls
	-- use('jose-elias-alvarez/null-ls.nvim')

	-- mason-null-ls.nvim
	-- use {
	-- 	"jay-babu/mason-null-ls.nvim",
	-- 	event = { "BufReadPre", "BufNewFile" },
	-- 	dependencies = {
	-- 		"williamboman/mason.nvim",
	-- 		"jose-elias-alvarez/null-ls.nvim",
	-- 	},
	-- 	config = function()
	-- 		require("mason").setup()
	-- 		require("mason-null-ls").setup({
	-- 			handlers = {},
	-- 		})
	-- 	end,
	-- }
end)
