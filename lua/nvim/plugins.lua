local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap =
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- PLUGINS
return require("packer").startup(function(use)
	-- Neovim general functionality and apperence
	use("wbthomason/packer.nvim") -- Packer manages itself
	use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in neovim
	use("nvim-lua/plenary.nvim") -- Useful Lua functions used by many plugins
	use("nvim-lualine/lualine.nvim") -- lualine
	use("goolord/alpha-nvim") -- Neovim dashboard
	use("kyazdani42/nvim-tree.lua") --NvimTree file manager
	use("kyazdani42/nvim-web-devicons") -- Sets Icons
	use({ "akinsho/bufferline.nvim", tag = "v3.*", requires = "kyazdani42/nvim-web-devicons" }) --buffer (tabs)
	use("lewis6991/impatient.nvim") -- To make vim load faster
	use("wakatime/vim-wakatime") -- Productivity Metrics
	use("machakann/vim-highlightedyank") -- Highlight text being yanked
	use("ryanoasis/vim-devicons") -- Adds icons
	use({ "folke/which-key.nvim" }) -- Autosuggests commands
	use("nvim-zh/colorful-winsep.nvim") -- Make active window colorful
	use("RRethy/vim-illuminate") -- Highlight words and lines on the cursor for Neovim
	use("nacro90/numb.nvim") -- Peeks lines of the buffer in non-obtrusive way

	--Programming
	use("windwp/nvim-autopairs") --autopairs
	use("numToStr/Comment.nvim")
	use("JoosepAlviste/nvim-ts-context-commentstring")
	use("lukas-reineke/indent-blankline.nvim") --shows line indendation
	use("https://github.com/ap/vim-css-color.git") --CSS colors
	use("lewis6991/gitsigns.nvim") --Git indication
	use("akinsho/toggleterm.nvim")
	use("tpope/vim-surround") -- Surround text with brackets or quotes
	use("alvan/vim-closetag") -- Close HTML Tags
	use("mattn/emmet-vim") -- Use emmet snippets
	use("ahmedkhalf/project.nvim") -- Let's you open previously opened projects
	use({
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
	})
	use("kdheepak/lazygit.nvim")
	use("Pocco81/auto-save.nvim") -- Autosaves files on exiting insert
	use("Pocco81/true-zen.nvim") -- Autosaves files on exiting insert
	use("jose-elias-alvarez/typescript.nvim") -- Fixes tsserver issues
	use("xianzhon/vim-code-runner") -- Runs my code for me so that I don't have to
	use("nvim-pack/nvim-spectre") -- Search and Replace in project

	--Treesitter
	use("nvim-treesitter/nvim-treesitter") --Syntax highlighting

	-- Telescope
	use("nvim-telescope/telescope.nvim") -- telescope search engine

	--cmp plugins
	use("hrsh7th/nvim-cmp") -- completion plugin
	use("hrsh7th/cmp-buffer") -- buffer completions
	use("hrsh7th/cmp-path") -- path completions
	use("hrsh7th/cmp-cmdline") -- cmdline completions
	use("saadparwaiz1/cmp_luasnip") -- snippet completions
	use("hrsh7th/cmp-nvim-lsp") -- LSP completion for cmp

	--Snippets
	use("L3MON4D3/LuaSnip") -- snippet engine
	use("rafamadriz/friendly-snippets") -- many snippets to use

	-- LSP
	use({ "glepnir/lspsaga.nvim", branch = "main" })
	use({
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	})
	use("mfussenegger/nvim-dap")
	use("jose-elias-alvarez/null-ls.nvim") --formatters and linters
	use("mfussenegger/nvim-lint")
	use({ "mhartington/formatter.nvim" })
	use({ "prettier/vim-prettier", run = "yarn install" })

	-- Colorschemes
	use("dracula/vim")
	use("sainnhe/everforest")
	use("romgrk/doom-one.vim")
	use("arcticicestudio/nord-vim")
	use("ghifarit53/tokyonight-vim")
	use("ChristianChiarulli/nvcode-color-schemes.vim")
	use("tomasiser/vim-code-dark")
	use("rakr/vim-one")
	use("tomasr/molokai")
	use("liuchengxu/space-vim-dark")
	use("hzchirs/vim-material")
	use("dunstontc/vim-vscode-theme")
	use("sonph/onehalf")
	use("drewtempelmeyer/palenight.vim")
	use("frenzyexists/aquarium-vim")
	use("ukyouz/onedark.vim")
	use("blueshirts/darcula")
	use("rafalbromirski/vim-aurora")
	use("reewr/vim-monokai-phoenix")
	use({ "lunarvim/onedarker.nvim", branch = "freeze" })

	-- Others
	use({
		"folke/trouble.nvim",
		cmd = "TroubleToggle",
	})
	use("github/copilot.vim")
	use({ "krivahtoo/silicon.nvim", run = "./install.sh" })
end)
