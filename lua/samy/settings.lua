vim.cmd.colorscheme("catppuccin-mocha")
-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

vim.g.mapleader = " "
vim.g.have_nerd_font = true

local opts = vim.opt

-- Line Numbers
opts.nu = true
opts.relativenumber = true

-- Indenting
opts.tabstop = 4
opts.softtabstop = 4
opts.shiftwidth = 4
opts.expandtab = true
opts.smartindent = true

-- General Settings
opts.wrap = false
opts.swapfile = false
opts.backup = false
opts.undodir = "C:\\Users\\samy3\\AppData\\Local\\nvim\\undodir"
opts.undofile = true
opts.cursorline = true

-- Searching
opts.hlsearch = false
opts.incsearch = true

-- Colors and shit
opts.termguicolors = true
opts.scrolloff = 8
opts.shortmess:append("c")
opts.isfname:append("@-@")
opts.updatetime = 50

-- More Utilities
vim.cmd([[
set whichwrap+=<,>,[,],h,l
set iskeyword+=-
]])
