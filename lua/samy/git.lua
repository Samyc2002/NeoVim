local neogit = require('neogit')
local gitsigns = require('gitsigns')

local keymap = vim.keymap

keymap.set("n", "<leader>gs", function()
	neogit.open({})
end)

keymap.set("n", "<leader>gc", function()
	neogit.open({ "commit" })
end)
keymap.set("n", "<leader>gp", function()
	neogit.open({ "pull" })
end)

keymap.set("n", "<leader>gP", function()
	neogit.open({ "push" })
end)

keymap.set("n", "<leader>ha", function()
	gitsigns.stage_hunk()
end)

keymap.set("n", "<leader>lb", function()
	gitsigns.blame_line()
end)

keymap.set("n", "<leader>hd", function()
	gitsigns.diffthis()
end)
