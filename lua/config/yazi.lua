local M = {}

M.keys = {
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
}

M.opts = {
	-- if you want to open yazi instead of netrw, see below for more info
	open_for_directories = false,
}

return M
