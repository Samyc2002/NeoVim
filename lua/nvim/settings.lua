-- Load Nvim Faster
require("impatient")

local options = {
	backup = false,
	clipboard = "unnamedplus",
	cmdheight = 1,
	completeopt = { "menuone", "noselect" },
	conceallevel = 0,
	fileencoding = "utf-8",
	hlsearch = true,
	ignorecase = true,
	mouse = "a",
	pumheight = 10,
	showmode = false,
	showtabline = 3,
	smartcase = true,
	smartindent = true,
	splitbelow = true,
	splitright = true,
	swapfile = false,
	termguicolors = true,
	ttimeoutlen = 100,
	undofile = true,
	updatetime = 300,
	writebackup = false,
	expandtab = true,
	shiftwidth = 2,
	tabstop = 2,
	cursorline = true,
	number = true,
	relativenumber = true,
	numberwidth = 4,
	signcolumn = "yes",
	wrap = false,
	scrolloff = 8,
	sidescrolloff = 8,
	guifont = "JetBrainsMono Nerd Font:h11",
	fillchars = "vert:│",
	laststatus = 3,
	linespace = 3,
}

vim.opt.shortmess:append("c")

for key, value in pairs(options) do
	vim.opt[key] = value
end

vim.cmd([[
set whichwrap+=<,>,[,],h,l
set iskeyword+=-
hi VertSplit ctermbg=NONE guibg=NONE
]])
