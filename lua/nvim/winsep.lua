local status_ok, winsep = pcall(require, "colorful-winsep")
if not status_ok then
	return
end

winsep.setup({
	direction = {
		down = "j",
		left = "h",
		right = "l",
		up = "k",
	},
	highlight = {
		guibg = vim.api.nvim_get_hl_by_name("Normal", true)["background"],
		guifg = "#957CC6",
	},
	-- refresh interval
	interval = 100,
	no_exec_files = { "packer", "TelescopePrompt", "mason", "CompetiTest" },
	symbols = { "━", "┃", "┏", "┓", "┗", "┛" },
	win_opts = {
		relative = "editor",
		style = "minimal",
	},
})
