local M = {
	opts = {
		enabled = true,
		scope = {
			min_size = 5,
			max_size = 20,
			siblings = true,
		},
		animate = {
			enabled = vim.fn.has("nvim-0.10") == 1,
			easing = "inOutSine",
			duration = {
				step = 20, -- ms per step
				total = 300, -- maximum duration
			},
		},
		filter = function(buf)
			return vim.g.snacks_dim ~= false and vim.b[buf].snacks_dim ~= false and vim.bo[buf].buftype == ""
		end,
	}
}

return M
