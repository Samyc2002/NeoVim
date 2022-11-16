local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
  return
end

fn = vim.fn
local marginTopPercent = 0.3
local headerPadding = fn.max({ 2, fn.floor(fn.winheight(0) * marginTopPercent) })

local dashboard = require("alpha.themes.dashboard")
dashboard.section.header.type = "text"
dashboard.section.header.val = {
  [[                               __                ]],
  [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
  [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
  [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
  [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
  [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
}
dashboard.section.header.opts = {
  position = "center",
  hl = "AlphaHeader",
}
dashboard.section.buttons.val = {
  dashboard.button("SPC N", "  New file", ":ene <BAR> startinsert <CR>"),
  dashboard.button("SPC f", "  Find file", ":Telescope find_files <CR>"),
  dashboard.button("SPC t", "  Find text", ":Telescope live_grep <CR>"),
  dashboard.button("SPC r r", "  Recently used files", ":Telescope oldfiles <CR>"),
  dashboard.button("SPC r c", "勒  Reload Configuration", ":so %<CR>"),
  dashboard.button("SPC d", "  Documents", ":e ~/Documents/ <CR>"),
  dashboard.button("SPC p", "  Development", ":e ~/Projects/ <CR>"),
  dashboard.button("SPC p d", "       Projects", ":e ~/Projects/ <CR>"),
  dashboard.button("SPC p s", "       Shram", ":e ~/Projects/react-n-ftend/ <CR>"),
  dashboard.button("SPC n", "  Notes", ":NvimTreeToggle ~/Documents <CR>"),
  dashboard.button("SPC n i", "       Random Ideas", ":e ~/Documents/Ideas.md <CR>"),
  dashboard.button("SPC n n", "       Quick Notes", ":e ~/Documents/Notes.md <CR>"),
  dashboard.button("SPC n m", "       MoMs", ":e ~/Documents/MoMs.md <CR>"),
  dashboard.button("SPC c", "  Configuration files", ":e ~/configs <CR>"),
  dashboard.button("SPC c w", "       Window Manager", ":e ~/configs/bspwm/bspwmrc <CR>"),
  dashboard.button("SPC c n", "       Neovim", ":e ~/configs/nvim<CR>"),
  dashboard.button("SPC c k", "       Keybinds", ":e ~/configs/sxhkd/sxhkdrc <CR>"),
  dashboard.button("SPC c l", "       Lock Screen", ":e ~/configs/betterlockscreen/betterlockscreenrc <CR>"),
  dashboard.button("SPC q", "  Quit Neovim", ":qa<CR>"),
}

local function footer()
  -- NOTE: requires the fortune-mod package to work
  -- local handle = io.popen("fortune")
  -- local fortune = handle:read("*a")
  -- handle:close()
  -- return fortune
  return ""
end

dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true

--[[ dashboard.opts.layout = { ]]
--[[ 	{ type = "padding", val = headerPadding }, ]]
--[[ 	{ type = "padding", val = 2 }, ]]
--[[ } ]]
-- vim.cmd([[autocmd User AlphaReady echo 'ready']])
alpha.setup(dashboard.opts)
