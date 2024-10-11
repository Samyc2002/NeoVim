-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
    spec = {
        -- File switcher
        {
            'nvim-telescope/telescope.nvim',
            tag = '0.1.8',
            dependencies = { 'nvim-lua/plenary.nvim' }
        },
        -- File Manager
        -- "kevinhwang91/rnvimr",
        {
            "mikavilpas/yazi.nvim",
            event = "VeryLazy",
            keys = {
                -- 👇 in this section, choose your own keymappings!
                {
                    "<leader>pv",
                    function()
                        require("yazi").yazi()
                    end,
                    desc = "Open the file manager",
                },
                {
                    -- Open in the current working directory
                    "<leader>cw",
                    function()
                        require("yazi").yazi(nil, vim.fn.getcwd())
                    end,
                    desc = "Open the file manager in nvim's working directory",
                },
            },
            opts = {
                -- if you want to open yazi instead of netrw, see below for more info
                open_for_directories = false,
            },
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
            opts = {
                ensure_installed = { 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'vim', 'vimdoc', 'javascript', 'rust', 'typescript' },
                -- Autoinstall languages that are not installed
                auto_install = true,
                highlight = {
                    enable = true,
                    -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
                    --  If you are experiencing weird indenting issues, add the language to
                    --  the list of additional_vim_regex_highlighting and disabled languages for indent.
                    additional_vim_regex_highlighting = { 'ruby' },
                },
                indent = { enable = true, disable = { 'ruby' } },
            },
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
                "ibhagwan/fzf-lua",       -- optional
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
                'j-hui/fidget.nvim', }
        },
        { 'hrsh7th/cmp-nvim-lsp' },
        {
            'hrsh7th/nvim-cmp',
            event = 'InsertEnter',
            dependencies = { 'L3MON4D3/LuaSnip',
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
        -- Optional
        'nvim-treesitter/nvim-treesitter-context',
        -- Utility plugins
        -- Highlight todo, notes, etc in comments
        { 'folke/todo-comments.nvim',            event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },
        { -- Collection of various small independent plugins/modules
            'echasnovski/mini.nvim',
            config = function()
                require('mini.ai').setup { n_lines = 500 }
                require('mini.surround').setup()
                require('mini.starter').setup()
            end,
        },
        {
            "folke/noice.nvim",
            config = function()
                require("noice").setup({
                    -- add any options here
                    routes = {
                        {
                            filter = {
                                event = 'msg_show',
                                any = {
                                    { find = '%d+L, %d+B' },
                                    { find = '; after #%d+' },
                                    { find = '; before #%d+' },
                                    { find = '%d fewer lines' },
                                    { find = '%d more lines' },
                                },
                            },
                            opts = { skip = true },
                        }
                    },
                })
            end,
            dependencies = {
                -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
                "MunifTanjim/nui.nvim",
                -- OPTIONAL:
                --   `nvim-notify` is only needed, if you want to use the notification view.
                --   If not available, we use `mini` as the fallback
                "rcarriga/nvim-notify",
            }
        },
        'nvim-lualine/lualine.nvim',
        -- Life changing plugins
        {
            "windwp/nvim-autopairs",
            config = function() require("nvim-autopairs").setup {} end
        },
        { "lukas-reineke/indent-blankline.nvim", main = "ibl",       opts = {} },
        'numToStr/Comment.nvim', -- "gc" to comment visual regions/lines
        'JoosepAlviste/nvim-ts-context-commentstring',
        'tpope/vim-sleuth',      -- Detect tabstop and shiftwidth automatically
        'ap/vim-css-color',
        'alvan/vim-closetag',
        'p00f/nvim-ts-rainbow',
        'RRethy/vim-illuminate',
        {
            'rmagatti/goto-preview',
            config = function()
                require('goto-preview').setup {
                    width = 120, -- Width of the floating window
                    height = 15, -- Height of the floating window
                    border = { "↖", "─", "┐", "│", "┘", "─", "└", "│" }, -- Border characters of the floating window
                    default_mappings = true,
                    debug = false, -- Print debug information
                    opacity = nil, -- 0-100 opacity level of the floating window where 100 is fully transparent.
                    resizing_mappings = false, -- Binds arrow keys to resizing the floating window.
                    post_open_hook = nil, -- A function taking two arguments, a buffer and a window to be ran as a hook.
                    references = { -- Configure the telescope UI for slowing the references cycling window.
                        telescope = require("telescope.themes").get_dropdown({ hide_preview = false })
                    },
                    -- These two configs can also be passed down to the goto-preview definition and implementation calls for one off "peak" functionality.
                    focus_on_open = true,                                        -- Focus the floating window when opening it.
                    dismiss_on_move = false,                                     -- Dismiss the floating window when moving the cursor.
                    force_close = true,                                          -- passed into vim.api.nvim_win_close's second argument. See :h nvim_win_close
                    bufhidden = "wipe",                                          -- the bufhidden option to set on the floating window. See :h bufhidden
                    stack_floating_preview_windows = true,                       -- Whether to nest floating windows
                    preview_window_title = { enable = true, position = "left" }, -- Whether
                }
            end
        },

        {
            "folke/trouble.nvim",
            dependencies = "nvim-tree/nvim-web-devicons",
            config = function()
                require("trouble").setup {
                    -- your configuration comes here
                    -- or leave it empty to use the default settings
                    -- refer to the configuration section below
                }
            end
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
        }
    },
    -- Configure any other settings here. See the documentation for more details.
    -- colorscheme that will be used when installing plugins.
    install = { missing = true, colorscheme = { "catppuccin-mocha" } },
    -- automatically check for plugin updates
    checker = { enabled = true, notify = false },
}, {
    ui = {
        -- If you are using a Nerd Font: set icons to an empty table which will use the
        -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
        icons = vim.g.have_nerd_font and {} or {
            cmd = '⌘',
            config = '🛠',
            event = '📅',
            ft = '📂',
            init = '⚙',
            keys = '🗝',
            plugin = '🔌',
            runtime = '💻',
            require = '🌙',
            source = '📄',
            start = '🚀',
            task = '📌',
            lazy = '💤 ',
        },
    },
})
