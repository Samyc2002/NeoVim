local status_ok, devicons = pcall(require, "nvim-web-devicons")
if not status_ok then
	return
end

local icons = require("constants.icons")

devicons.setup({
	override = icons.devicons,
	color_icons = true,
	default = true,
})
