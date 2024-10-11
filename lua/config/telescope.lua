local builtin = require("telescope.builtin")

local keymap = vim.keymap

keymap.set("n", "<leader>pf", builtin.find_files, {})
keymap.set("n", "<leader>bl", builtin.buffers, {})
keymap.set("n", "<leader>pp", builtin.git_files, {})
keymap.set("n", "<leader>ps", function ()
	builtin.grep_string({ search = vim.fn.input("Search: ") });
end)
