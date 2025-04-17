local M = {}

-- Common table to enable features in snacks
local enable = { enabled = true }

-- Enable featuers and stylize them here
M.opts = {
	-- Configurations for snacks
	dim = enable,
	notifier = require("config.snacks.notifier").opts,
	bigfile = enable,
	explorer = enable,
	indent = enable,
	input = require("config.snacks.input").opts,
	picker = enable,
	quickfile = enable,
	scope = enable,
	scroll = enable,
	statuscolumn = enable,
	words = enable,
	terminal = enable,
	zen = enable,
	-- Styles for different snacks
	styles = {
		dim = require("config.snacks.dim").styles,
		input = require("config.snacks.input").styles,
		picker = require("config.snacks.picker").styles,
		scroll = require("config.snacks.scroll").styles,
		terminal = require("config.snacks.terminal").styles,
	}
}

-- Add keybindings to snacks
M.keys = {
	-- Explorer stuff
	{ "<leader>pf",      function() Snacks.picker.files() end,          desc = "Find Files" },
	{ "<leader>bl",      function() Snacks.picker.buffers() end,        desc = "Find Buffers" },
	{ "<leader>pp",      function() Snacks.picker.git_files() end,      desc = "Find Git Files" },
	{ "<leader>ps",      function() Snacks.picker.grep() end,           desc = "Project Search" },
	{ "<leader><space>", function() Snacks.picker.smart() end,          desc = "Smart Find Files" },
	-- { "<leader>e", function() Snacks.explorer() end, desc = "File Explorer" },
	-- Zen
	{ "<leader>z",       function() Snacks.zen() end,                   desc = "Toggle Zen Mode" },
	{ "<leader>Z",       function() Snacks.zen.zoom() end,              desc = "Toggle Zoom" },
	-- Terminal
	{ "<leader>`",       function() Snacks.terminal() end,              desc = "Toggle Terminal" },
	-- Notifs
	{ "<leader>n",       function() Snacks.notifier.show_history() end, desc = "Notification History" },
	{ "<leader>nn",      function() Snacks.notifier.hide() end,         desc = "Dismiss All Notifications" },
}

M.init = function()
	vim.api.nvim_create_autocmd("User", {
		pattern = "VeryLazy",
		callback = function()
			-- Setup some globals for debugging (lazy-loaded)
			_G.dd = function(...)
				Snacks.debug.inspect(...)
			end
			_G.bt = function()
				Snacks.debug.backtrace()
			end
			vim.print = _G.dd -- Override print to use snacks for `:=` command

			-- Create some toggle mappings
			Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
			Snacks.toggle.diagnostics():map("<leader>ud")
			Snacks.toggle.option("conceallevel",
				{ off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }):map("<leader>uc")
			Snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map(
				"<leader>ub")
			Snacks.toggle.inlay_hints():map("<leader>uh")
			Snacks.toggle.indent():map("<leader>ug")
			Snacks.toggle.dim():map("<leader>uD")
			Snacks.toggle.profiler():map("<leader>PP")
			Snacks.toggle.profiler_highlights():map("<leader>Ph")
			-- Initialize on starting nvim
			Snacks.dim()
			Snacks.toggle.indent()
		end,
	})
end

-- Integrate snacks to other plugins
M.others = {}

M.others.trouble = {
	specs = {
		"folke/snacks.nvim",
		opts = function(_, opts)
			return vim.tbl_deep_extend("force", opts or {}, {
				picker = {
					actions = require("trouble.sources.snacks").actions,
					win = {
						input = {
							keys = {
								["<c-t>"] = {
									"trouble_open",
									mode = { "n", "i" },
								},
							},
						},
					},
				},
			})
		end,
	},
}

return M
