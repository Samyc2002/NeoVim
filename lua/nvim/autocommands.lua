local autocmd = vim.api.nvim_create_autocmd

autocmd("BufEnter", {
  pattern = { "*.c", "*.cpp" },
  command = "setlocal ts=4 sw=4",
})

autocmd("BufEnter", {
  pattern = { "*.pdf" },
  command = "!zathura '%'",
})

autocmd("BufEnter", {
  pattern = { "*.pdf" },
  command = "bdelete %",
})
