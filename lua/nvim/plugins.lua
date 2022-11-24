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
	use("wbthomason/packer.nvim") -- Cuz you don't need to satisfy Packer
	use("nvim-lua/popup.nvim") -- Pops up the UI
	use("nvim-lua/plenary.nvim") -- Cuz plugins can't work alone
	use("nvim-lualine/lualine.nvim") -- Shows a cool looking status line for me
	use("goolord/alpha-nvim") -- Shows me a sexy dashboard
	use("kyazdani42/nvim-tree.lua") --File Tree for Neovim
	use("kyazdani42/nvim-web-devicons") -- Sets Icons for me
	use({ "akinsho/bufferline.nvim", tag = "v3.*", requires = "kyazdani42/nvim-web-devicons" }) -- Shows a cool looking tabline (shows me tabs basically)
	use("lewis6991/impatient.nvim") -- Hayaku
	use("wakatime/vim-wakatime") -- Makes you Productive (by showing you how productive you are)
	use("machakann/vim-highlightedyank") -- Highlight text being copied
	use("ryanoasis/vim-devicons") -- Adds more icons
	use({ "folke/which-key.nvim" }) -- Autosuggests commands to me (yeah I forget em)
	use("nvim-zh/colorful-winsep.nvim") -- Make active window (or rather the split) colorful
	use("RRethy/vim-illuminate") -- Highlight words and lines on the cursor(yeah, looks good)
	use("nacro90/numb.nvim") -- Peeks lines of the buffer I'm working with
	use({
		"folke/trouble.nvim",
		cmd = "TroubleToggle",
	}) -- The usual trouble maker

	--Programming
	use("windwp/nvim-autopairs") -- Autocompletes parentheses and quotes cuz I'm lazy
	use("numToStr/Comment.nvim") -- Comments on every decision you make
	use("JoosepAlviste/nvim-ts-context-commentstring") -- Does something (you better figure it out yourself)
	use("lukas-reineke/indent-blankline.nvim") -- Indents the blank lines as well. Yeah I'm Jobless
	use("https://github.com/ap/vim-css-color.git") -- shows CSS colors to me (cuz I'm colorblind)
	use("lewis6991/gitsigns.nvim") -- Do you finally Git it ?
	use("akinsho/toggleterm.nvim") -- It does what you think it does
	use("tpope/vim-surround") -- Surround text with brackets or quotes. Yeah a life saver
	use("alvan/vim-closetag") -- Close HTML Tags for me so I don't have to
	use("mattn/emmet-vim") -- Use emmet snippets
	use("ahmedkhalf/project.nvim") -- Let's you open previously opened projects
	use({
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
	}) -- Proviews markdown (yeah an illegal move, I know)
	use("kdheepak/lazygit.nvim") -- Lazygit plugin for lazy people like me
	use("Pocco81/auto-save.nvim") -- Autosaves files on exiting insert (again for lazy people)
	use("Pocco81/true-zen.nvim") -- Takes you to that productive mode where you can do anything
	use("jose-elias-alvarez/typescript.nvim") -- Fixes tsserver issues (it really does)
	use("xianzhon/vim-code-runner") -- Runs my code for me so that I don't have to
	use("nvim-pack/nvim-spectre") -- Search and Replace in project (yeah it can even compare to vscode)

	--Treesitter
	use("nvim-treesitter/nvim-treesitter") --Syntax highlighting to make nvim better
	use("p00f/nvim-ts-rainbow") -- Colours the nested brackets with different colours similar to what vscode does

	-- Telescope
	use("nvim-telescope/telescope.nvim") -- telescope search engine (google for neovim)

	--cmp plugins
	use("hrsh7th/nvim-cmp") -- completion plugin (completes your life)
	use("hrsh7th/cmp-buffer") -- buffer completions (completes your buffers)
	use("hrsh7th/cmp-path") -- path completions (completes your path)
	use("hrsh7th/cmp-cmdline") -- cmdline completions (completes your command line)
	use("saadparwaiz1/cmp_luasnip") -- snippet completions (for people who don't wanns write much. Yah got a problem with that ?)
	use("hrsh7th/cmp-nvim-lsp") -- LSP completion for cmp (completes your LSP)
	use({ "tzachar/cmp-tabnine", run = "./install.sh", requires = "hrsh7th/nvim-cmp" }) -- Tabnine Support for nvim (makes neovim intelligent)
	use("github/copilot.vim") -- Makes Neovim even more intelligent

	--Snippets
	use("L3MON4D3/LuaSnip") -- snippet engine (gives life to snippets)
	use("rafamadriz/friendly-snippets") -- many snippets to use (brings more snippets)

	-- LSP
	use({ "glepnir/lspsaga.nvim", branch = "main" }) -- LSP taken further to move forward in life
	use({
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	}) -- LSP packages (yah better not mess with these)
	use("mfussenegger/nvim-dap") -- Debuggers to add bugs to your code
	use("jose-elias-alvarez/null-ls.nvim") --formatters and linters to make your code ugly
	use("mfussenegger/nvim-lint") -- More linting for higher ugliness score
	use({ "mhartington/formatter.nvim" }) -- More formatting for ugly code
	use({ "prettier/vim-prettier", run = "yarn install" }) -- Prettier code

	-- Colorschemes (They are what you think they are)
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
	use({ "krivahtoo/silicon.nvim", run = "./install.sh" }) -- Takes Screenshots of my code (cool right ?)
end)
