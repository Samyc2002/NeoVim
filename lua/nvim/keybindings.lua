local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

local keybinds = {
  -- Normal --
  n = {
    -- Better window navigation
    { binding = "<C-h>", actual = "<C-w>h" },
    { binding = "<C-j>", actual = "<C-w>j" },
    { binding = "<C-k>", actual = "<C-w>k" },
    { binding = "<C-l>", actual = "<C-w>l" },

    -- Resize with arrows
    { binding = "<C-Up>", actual = ":resize -2<CR>" },
    { binding = "<C-Down>", actual = ":resize +2<CR>" },
    { binding = "<C-Left>", actual = ":vertical resize -2<CR>" },
    { binding = "<C-Right>", actual = ":vertical resize +2<CR>" },

    -- Navigate buffers
    { binding = "L", actual = ":bnext<CR>" },
    { binding = "H", actual = ":bprevious<CR>" },
    { binding = "<C-S-L>", actual = ":BufferLineMoveNext<CR>" },
    { binding = "<C-S-H>", actual = ":BufferLineMovePrev<CR>" },
    { binding = "C", actual = ":bdelete %<CR>" },

    -- Move text up and down
    { binding = "<A-j>", actual = "<Esc>:m .+1<CR>==" },
    { binding = "<A-k>", actual = "<Esc>:m .-2<CR>==" },
    { binding = "<A-Down>", actual = "<Esc>:m .+1<CR>==" },
    { binding = "<A-Up>", actual = "<Esc>:m .-2<CR>==" },

    -- NvimTree
    { binding = "<leader>e", actual = ":NvimTreeToggle<cr>" },

    -- Git Keymaps
    { binding = "<leader>gg", actual = ":LazyGit<CR>" },
    { binding = "<leader>gc", actual = ":Lspsaga code_action<CR>" },
    { binding = "<leader>gd", actual = ":Gitsigns diffthis<CR>" },
    { binding = "<leader>gn", actual = ":Gitsigns next_hunk<CR>" },
    { binding = "<leader>gp", actual = ":Gitsigns prev_hunk<CR>" },

    -- Zen Mode bindings
    { binding = "<leader>zn", actual = ":TZNarrow<CR>" },
    { binding = "<leader>zf", actual = ":TZFocus<CR>" },
    { binding = "<leader>zm", actual = ":TZMinimalist<CR>" },
    { binding = "<leader>za", actual = ":TZAtaraxis<CR>" },

    -- Spectre Keybinds for search and replace
    { binding = "<leader>ss", actual = "<cmd>lua require('spectre').open()<CR>" },
    { binding = "<leader>sw", actual = "<cmd>lua require('spectre').open_visual({select_word=true})<CR>" },
    { binding = "<leader>sf", actual = "<cmd>lua require('spectre').open_visual()<CR>" },
    { binding = "<leader>sp", actual = "<cmd>lua require('spectre').open_file_search()<CR>" },

    -- Alpha Keymaps
    { binding = "<leader>N", actual = ":ene <BAR> startinsert <CR>" },
    { binding = "<leader>f", actual = ":Telescope find_files <CR>" },
    { binding = "<leader>t", actual = ":Telescope live_grep <CR>" },
    { binding = "<leader>rr", actual = ":Telescope oldfiles <CR>" },
    { binding = "<leader>rc", actual = ":so %<CR>" },
    { binding = "<leader>pd", actual = ":e ~/Projects/ <CR>" },
    { binding = "<leader>ps", actual = ":e ~/Projects/react-n-ftend/ <CR>" },
    --[[ { binding = "<leader>n", actual = ":NvimTreeToggle ~/Documents <CR>" }, ]]
    --[[ { binding = "<leader>ni", actual = ":e ~/Documents/Ideas.md <CR>" }, ]]
    --[[ { binding = "<leader>nn", actual = ":e ~/Documents/Notes.md <CR>" }, ]]
    --[[ { binding = "<leader>nm", actual = ":e ~/Documents/MoMs.md <CR>" }, ]]
    { binding = "<leader>c", actual = ":e ~/configs <CR>" },
    { binding = "<leader>cw", actual = ":e ~/configs/bspwm/bspwmrc <CR>" },
    { binding = "<leader>ck", actual = ":e ~/configs/sxhkd/sxhkdrc <CR>" },
    { binding = "<leader>cl", actual = ":e ~/configs/betterlockscreen/betterlockscreenrc <CR>" },
    { binding = "<leader>q", actual = ":qa<CR>" },

    -- Extra Keybinds
    { binding = "<C-t>", actual = ":ToggleTerm<CR>" },
    { binding = "<C-T>", actual = ":terminal<CR>" },
    { binding = "<C-p>", actual = ":Telescope find_files<CR>" },
    { binding = "<leader>h", actual = ":nohlsearch<CR>" },
    { binding = "<esc>", actual = ":noh<CR>" },
    { binding = ":w<CR>", actual = ":Format<CR>:w<CR>" },
    { binding = "<leader>st", actual = ":ASToggle<CR>" },
    { binding = "<leader>pp", actual = ":Telescope projects<CR>" },
    { binding = "<leader>ps", actual = ":'<,'>Silicon<CR>" },
    { binding = "<leader>bf", actual = ":Format<CR>" },
  },

  -- Insert --
  i = {
    -- Press jk fast to exit insert mode
    { binding = "jk", actual = "<Esc>" },
  },

  -- Visual --
  v = {
    -- Stay in indent mode
    { binding = "<", actual = "<gv" },
    { binding = ">", actual = ">gv" },

    -- Move text up and down
    { binding = "<A-j>", actual = ":m .+1<CR>==" },
    { binding = "<A-k>", actual = ":m .-2<CR>==" },
    { binding = "<A-Down>", actual = ":m .+1<CR>==" },
    { binding = "<A-Up>", actual = ":m .-2<CR>==" },

    -- Paste text without rewriting the current clipboard
    { binding = "P", actual = "_dP" },
  },

  -- Visual Block --
  x = {
    { binding = "<A-j>", actual = ":move '>+1<CR>gv-gv" },
    { binding = "<A-k>", actual = ":move '<-2<CR>gv-gv" },
    { binding = "<A-Down>", actual = ":move '>+1<CR>gv-gv" },
    { binding = "<A-Up>", actual = ":move '<-2<CR>gv-gv" },
  },

  -- Terminal --
  -- t = {
  --   { binding = "<C-h>", actual = "<C-\\><C-N><C-w>h" },
  --   { binding = "<C-j>", actual = "<C-\\><C-N><C-w>j" },
  --   { binding = "<C-k>", actual = "<C-\\><C-N><C-w>k" },
  --   { binding = "<C-l>", actual = "<C-\\><C-N><C-w>l" },
  -- },
}

for mode, keys in pairs(keybinds) do
  for _, keybind in ipairs(keys) do
    if mode == "t" then
      keymap(mode, keybind.binding, keybind.actual, term_opts)
    else
      keymap(mode, keybind.binding, keybind.actual, opts)
    end
  end
end
