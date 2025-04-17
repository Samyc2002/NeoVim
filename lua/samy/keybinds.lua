vim.g.mapleader = " "

local keymap = vim.keymap

-- keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- VS Code style shifting
keymap.set("v", "J", ":m '>=1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Keybindings to make life easy
keymap.set("i", "jj", "<Esc>")
keymap.set("n", "Y", "yg$")
keymap.set("n", "J", "mzJ`z")
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

-- Copy paste Keybindings for various utilities
keymap.set("x", "<leader>p", "\"_dP")
keymap.set("n", "<leader>y", "\"+y")
keymap.set("v", "<leader>y", "\"+y")
keymap.set("n", "<leader>Y", "\"+Y")
keymap.set("n", "<leader>d", "\"_d")
keymap.set("v", "<leader>d", "\"_d")

-- More life enhancement Keybindings
keymap.set("n", "Q", "<nop>")
keymap.set("n", "<leader>f", function()
    vim.lsp.buf.format({ async = true })
end)
keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Error navigation
keymap.set("n", "<C-k>", "<cmd>cprev<CR>", { silent = true })
keymap.set("n", "<C-j>", "<cmd>cnext<CR>", { silent = true })

-- Buffer navigation
keymap.set("n", "<leader>bx", "<cmd>bdelete<CR>", { silent = true })
keymap.set("n", "<leader>bb", "<cmd>bnext<CR>", { silent = true })
keymap.set("n", "<leader>bB", "<cmd>bprev<CR>", { silent = true })

-- Keybindings for some bloat
keymap.set("n", "<leader>o", "<cmd>Lspsaga outline<CR>", { silent = true })
keymap.set("n", "<F2>", "<cmd>Lspsaga rename<CR>", { silent = true })
keymap.set("n", "gr", "<cmd>Lspsaga finder<CR>", { silent = true })
keymap.set("n", "L", "<cmd>Lspsaga code_action<CR>", { silent = true })
keymap.set("n", "<leader>h", "<cmd>Lspsaga outgoing_calls<CR>", { silent = true })
keymap.set("n", "<leader>H", "<cmd>Lspsaga incoming_calls<CR>", { silent = true })
keymap.set("n", "<leader>T", "<cmd>Twilight<CR>", { silent = true })
