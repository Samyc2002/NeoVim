local fn = vim.fn
local autocmd = vim.api.nvim_create_autocmd
local prefetch = vim.api.nvim_create_augroup("prefetch", { clear = true })

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

autocmd("BufRead", {
	group = prefetch,
	pattern = "*.py",
	callback = function()
		require("cmp_tabnine"):prefetch(fn.expand("%:p"))
	end,
})
