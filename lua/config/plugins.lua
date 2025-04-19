local plugins = {
	-- File Manager
	{
		"mikavilpas/yazi.nvim",
		event = "VeryLazy",
		keys = require("config.yazi").keys,
		opts = require("config.yazi").opts,
	},
	-- Colorscheme
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000
	},
	-- Must have plugins
	{ "nvim-lua/plenary.nvim" },
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		opts = require("config.treesitter-config").opts,
	},
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" }
	},
	{ "mbbill/undotree" },
	{
		"NeogitOrg/neogit",
		dependencies = {
			"sindrets/diffview.nvim", -- optional - Diff integration
			-- Only one of these is needed, not both.
			"ibhagwan/fzf-lua", -- optional
		},
		config = true
	},
	{ "lewis6991/gitsigns.nvim" },
	-- LSP Setup
	{ 'williamboman/mason.nvim' },
	{ 'williamboman/mason-lspconfig.nvim' },
	{ 'WhoIsSethDaniel/mason-tool-installer.nvim' },
	{ 'j-hui/fidget.nvim', },
	{ 'folke/neodev.nvim' },
	{
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x'
	},
	{
		'neovim/nvim-lspconfig',
		dependencies = {
			-- Useful status updates for LSP
			'j-hui/fidget.nvim',
		}
	},
	{ 'hrsh7th/cmp-nvim-lsp' },
	{
		'hrsh7th/nvim-cmp',
		event = 'InsertEnter',
		dependencies = {
			'L3MON4D3/LuaSnip',
			'saadparwaiz1/cmp_luasnip',
			-- Adds other completion capabilities.
			--  nvim-cmp does not ship with all sources by default. They are split
			--  into multiple repos for maintenance purposes.
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-path',
		},
	},
	{ 'leafOfTree/vim-svelte-plugin' },
	{ 'othree/html5.vim' },
	{ 'pangloss/vim-javascript' },
	{ 'evanleck/vim-svelte',         branch = 'main' },
	{ "prettier/vim-prettier",       build = "yarn install" },
	{
		'nvimdev/lspsaga.nvim',
		config = require("config.lspsaga").config,
		dependencies = {
			'nvim-treesitter/nvim-treesitter', -- optional
			'nvim-tree/nvim-web-devicons', -- optional
		}
	},
	-- Optional
	'nvim-treesitter/nvim-treesitter-context',
	-- Utility plugins
	-- Highlight todo, notes, etc in comments
	{
		'folke/todo-comments.nvim',
		event = 'VimEnter',
		dependencies = { 'nvim-lua/plenary.nvim' },
		opts = { signs = false },
		keys = require("config.todo").keys,
	},
	{ -- Collection of various small independent plugins/modules
		'echasnovski/mini.nvim',
		config = function()
			local opts = require('config.mini')
			require('mini.ai').setup { n_lines = 500 }
			require('mini.surround').setup()
			require('mini.starter').setup(opts.starter)
		end,
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			-- add any options here
		},
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
		}
	},
	{
		"folke/edgy.nvim",
		---@module 'edgy'
		---@param opts Edgy.Config
		opts = require("config.edgy").opts,
	},
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		---@type snacks.Config
		opts = require("config.snacks").opts,
		keys = require("config.snacks").keys,
		init = require("config.snacks").init,
	},
	'nvim-lualine/lualine.nvim',
	{
		'simrat39/symbols-outline.nvim',
		config = function()
			require('symbols-outline').setup()
		end
	},
	-- Life changing plugins
	{
		"windwp/nvim-autopairs",
		config = function() require("nvim-autopairs").setup {} end
	},
	'numToStr/Comment.nvim', -- "gc" to comment visual regions/lines
	'JoosepAlviste/nvim-ts-context-commentstring',
	'tpope/vim-sleuth',   -- Detect tabstop and shiftwidth automatically
	'ap/vim-css-color',
	'alvan/vim-closetag',
	'p00f/nvim-ts-rainbow',
	'RRethy/vim-illuminate',
	{
		'rmagatti/goto-preview',
		config = require("config.goto").config
	},
	{
		"folke/trouble.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			require("trouble").setup()
		end,
		spec = require("config.snacks").others.trouble.specs
	},
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function() vim.fn["mkdp#util#install"]() end,
	},
	{
		'Exafunction/codeium.vim',
		event = 'BufEnter'
	},
}

return plugins
