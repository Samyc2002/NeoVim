M = {}

M.config = function()
	local opts = require("config.lspsaga")
	require('lspsaga').setup(opts)
end

M.symbol_in_winbar = {
	hide_keyword = true,
	folder_level = 0,
}

M.finder = {
	keys = {
		toggle_or_open = '<CR>'
	}
}

return M
