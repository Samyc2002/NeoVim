local status_ok, whichkey = pcall(require, "which-key")
if not status_ok then
  return
end

local conf = {

  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "  ", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },

  popup_mappings = {
    scroll_down = "<c-d>", -- binding to scroll down inside the popup
    scroll_up = "<c-u>", -- binding to scroll up inside the popup
  },

  window = {
    border = "single", -- none/single/double/shadow
    margin = { 0, 40, 1, 40 },
  },

  layout = {
    spacing = 10, -- spacing between columns
    align = "center",
  },

  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ ", "<Plug>" },

  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    i = { "j", "k" },
    v = { "j", "k" },
  },
}

local opts = {
  mode = "n", -- Normal mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
  ["w"] = { "<cmd>update!<CR>", "Save" },
  ["q"] = { "<cmd>q!<CR>", "Quit" },

  b = {
    name = "Buffer",
    c = { "<Cmd>bd!<Cr>", "Close current buffer" },
    D = { "<Cmd>%bd|e#|bd#<Cr>", "Delete all buffers" },
    f = { "<Cmd>Format<Cr>", "Format current buffers" },
  },

  z = {
    name = "Zen Mode",
    n = { "<cmd>TZNarrowcr>", "Toggle Narrow mode" },
    f = { "<cmd>TZFocuscr>", "Toggle Focus mode" },
    m = { "<cmd>TZMinimalistcr>", "Toggle Minimal Mode" },
    a = { "<cmd>TZAtaraxiscr>", "Toggle True Zen Mode" },
  },

  g = {
    name = "Git",
    g = { "<cmd>LazyGit<cr>", "Open Lazy Git for current project" },
    c = { "<cmd>Lspsaga code_action<cr>", "Show Code Actions for the current file" },
    d = { "<cmd>Gitsigns diffthis<cr>", "Show Git Diffs for the current file" },
    n = { "<cmd>Gitsigns next_hunk<cr>", "Show Next Git Hunk" },
    p = { "<cmd>Gitsigns prev_hunk<cr>", "Show Previous Git Hunk" },
  },

  c = {
    name = "Edit Configs",
    c = { ",cmd>e ~/configs/<cr>", "Open config directory" },
    w = { ",cmd>e ~/configs/bspwm/bspwmrc<cr>", "Open bspwm configs" },
    n = { ",cmd>e ~/configs/nvim<cr>", "Open nvim directory" },
    k = { ",cmd>e ~/configs/sxhkd/sxhkdrc<cr>", "Open window manager keybinds" },
    l = { ",cmd>e ~/configs/betterlockscreen/betterlockscreenrc<cr>", "Open lockscreen keybinds" },
  },

  s = {
    name = "Project Related",
    c = { "<cmd>'<,'>Silicon<cr>", "Get a Screenshot of the selected part of code" },
    s = { "<cmd>lua require('spectre').open()<CR>", "Search and replace in current project" },
    w = {
      "<cmd>lua require('spectre').open_visual({select_word=true})<CR>",
      "Search and replace current word in project",
    },
    f = { "<cmd>lua require('spectre').open_visual()<CR>", "Search and replace current word in current file" },
    p = { "<cmd>lua require('spectre').open_file_search()<CR>", "Search current file in project" },
  },

  r = {
    name = "Reload and Recents",
    r = { "<cmd>Telescope oldfiles <cr>", "Search Recent files" },
    c = { "<cmd>so %<cr>", "Reload nvim configurations" },
  },
}

--[[ print(require("which-key")) ]]
whichkey.setup(conf)
whichkey.register(mappings, opts)
