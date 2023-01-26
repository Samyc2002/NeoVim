local fn = vim.fn
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- For highlighting text being yanked (replacement for vim-highlightedyank)
autocmd("TextYankPost", {
  pattern = "*",
  command = "silent! lua vim.highlight.on_yank {timeout=300}",
})

-- For proper C++ formatting
autocmd("BufEnter", {
  pattern = { "*.c", "*.cpp" },
  command = "setlocal ts=4 sw=4",
})

-- To open PDF files in zathura directly
autocmd("BufEnter", {
  pattern = { "*.pdf" },
  command = "!zathura '%'",
})

-- To delete the pdf buffer once it if opened in zathura
autocmd("BufEnter", {
  pattern = { "*.pdf" },
  command = "bdelete %",
})

-- For tabnine autocompletions
local prefetch = augroup("prefetch", { clear = true })
autocmd("BufRead", {
  group = prefetch,
  pattern = "*.py",
  callback = function()
    require("cmp_tabnine"):prefetch(fn.expand("%:p"))
  end,
})

-- For vim scrollbars
local ScrollbarInit = augroup("ScrollbarInit", { clear = true })
autocmd({ "WinScrolled", "VimResized", "QuitPre" }, {
  pattern = "*",
  group = ScrollbarInit,
  command = "silent! lua require('scrollbar').show()",
})
autocmd({ "WinEnter", "FocusGained" }, {
  pattern = "*",
  group = ScrollbarInit,
  command = "silent! lua require('scrollbar').show()",
})
autocmd({ "WinLeave", "BufLeave", "BufWinLeave", "FocusLost" }, {
  pattern = "*",
  group = ScrollbarInit,
  command = "silent! lua require('scrollbar').clear()",
})
