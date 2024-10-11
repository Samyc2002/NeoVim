local neogit = require('neogit')

local keymap = vim.keymap

keymap.set("n", "<leader>gs", function()
	neogit.open({  })
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

