local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local hide_in_width = function()
	return vim.fn.winwidth(0) > 80
end

local seperators = require("constants.icons").statusline_separators

local diagnostics = {
	"diagnostics",
	sources = { "nvim_lsp" },
	sections = { "error", "warn" },
	symbols = { error = " ", warn = " " },
	colored = false,
	update_in_insert = false,
	always_visible = true,
}

local diff = {
	"diff",
	colored = false,
	symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
	cond = hide_in_width,
}

local mode = {
	"mode",
	fmt = function(str)
		return str
	end,
}

local filename = {
	"filename",
	path = 1,
	symbols = {
		modified = "", -- Text to show when the file is modified.
		readonly = "", -- Text to show when the file is non-modifiable or readonly.
		unnamed = "", -- Text to show for unnamed buffers.
		newfile = "", -- Text to show for new created file before first writting
	},
}

local filetype = {
	"filetype",
	icons_enabled = true,
	icon = nil,
	fmt = function(str)
		return str .. " "
	end,
}

local branch = {
	"branch",
	icons_enabled = true,
	icon = "",
}

local location = {
	"location",
}

local fileformat = {
	"fileformat",
	icons_enabled = true,
	symbols = {
		unix = "LF",
		dos = "CRLF",
		mac = "CR",
	},
}

-- cool function for progress
--[[ local progress = function() ]]
--[[ 	local current_line = vim.fn.line(".") ]]
--[[ 	local total_lines = vim.fn.line("$") ]]
--[[ 	local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" } ]]
--[[ 	local line_ratio = current_line / total_lines ]]
--[[ 	local index = math.ceil(line_ratio * #chars) ]]
--[[ 	return chars[index] ]]
--[[ end ]]

local spaces = function()
	return " " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end

lualine.setup({
	options = {
		icons_enabled = true,
		theme = "auto",
		component_separators = seperators.block,
		section_separators = seperators.block,
		disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
		always_divide_middle = true,
	},
	sections = {
		lualine_a = { mode },
		lualine_b = { branch },
		lualine_c = { diagnostics, filename, diff },
		lualine_x = { fileformat, spaces, location },
		lualine_y = { filetype },
		lualine_z = { "hostname" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = { "quickfix", "fugitive", "fzf" },
})
