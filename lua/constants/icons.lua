local M = {}

M.lspkind = {
	Namespace = "",
	Text = " ",
	Method = " ",
	Function = " ",
	Constructor = " ",
	Field = "ﰠ ",
	Variable = " ",
	Class = "ﴯ ",
	Interface = " ",
	Module = " ",
	Property = "ﰠ ",
	Unit = "塞 ",
	Value = " ",
	Enum = " ",
	Keyword = " ",
	Snippet = " ",
	Color = " ",
	File = " ",
	Reference = " ",
	Folder = " ",
	EnumMember = " ",
	Constant = " ",
	Struct = "פּ ",
	Event = " ",
	Operator = " ",
	TypeParameter = " ",
	Table = "",
	Object = " ",
	Tag = "",
	Array = "[]",
	Boolean = " ",
	Number = " ",
	Null = "ﳠ",
	String = " ",
	Calendar = "",
	Watch = " ",
	Package = "",
	Copilot = " ",
}

M.statusline_separators = {
	default = {
		right = "",
		left = " ",
	},

	round = {
		left = "",
		right = "",
	},

	block = {
		right = "",
		left = "",
	},

	arrow = {
		right = "",
		left = "",
	},
}

M.devicons = {
	default_icon = {
		icon = "",
		name = "Default",
		color = "#e06c75",
	},

	c = {
		icon = "",
		name = "c",
		color = "#61afef",
	},

	css = {
		icon = "",
		name = "css",
		color = "#61afef",
	},

	deb = {
		icon = "",
		name = "deb",
		color = "#a3b8ef",
	},

	Dockerfile = {
		icon = "",
		name = "Dockerfile",
		color = "#a3b8ef",
	},

	html = {
		icon = "",
		name = "html",
		color = "#DE8C92",
	},

	jpeg = {
		icon = "",
		name = "jpeg",
		color = "#c882e7",
	},

	jpg = {
		icon = "",
		name = "jpg",
		color = "#c882e7",
	},

	js = {
		icon = "",
		name = "js",
		color = "#EBCB8B",
	},

	kt = {
		icon = "󱈙",
		name = "kt",
		color = "#fca2aa",
	},

	lock = {
		icon = "",
		name = "lock",
		color = "#e06c75",
	},

	lua = {
		icon = "",
		name = "lua",
		color = "#61afef",
	},

	mp3 = {
		icon = "",
		name = "mp3",
		color = "#abb2bf",
	},

	mp4 = {
		icon = "",
		name = "mp4",
		color = "#abb2bf",
	},

	out = {
		icon = "",
		name = "out",
		color = "#abb2bf",
	},

	png = {
		icon = "",
		name = "png",
		color = "#c882e7",
	},

	py = {
		icon = "",
		name = "py",
		color = "#a3b8ef",
	},

	["robots.txt"] = {
		icon = "ﮧ",
		name = "robots",
		color = "#ff75a0",
	},

	toml = {
		icon = "",
		name = "toml",
		color = "#61afef",
	},

	ts = {
		icon = "ﯤ",
		name = "ts",
		color = "#519ABA",
	},

	ttf = {
		icon = "",
		name = "TrueTypeFont",
		color = "#abb2bf",
	},

	rb = {
		icon = "",
		name = "rb",
		color = "#ff75a0",
	},

	rpm = {
		icon = "",
		name = "rpm",
		color = "#fca2aa",
	},

	vue = {
		icon = "﵂",
		name = "vue",
		color = "#7eca9c",
	},

	woff = {
		icon = "",
		name = "WebOpenFontFormat",
		color = "#abb2bf",
	},

	woff2 = {
		icon = "",
		name = "WebOpenFontFormat2",
		color = "#abb2bf",
	},

	xz = {
		icon = "",
		name = "xz",
		color = "#EBCB8B",
	},

	zip = {
		icon = "",
		name = "zip",
		color = "#fca2aa",
	},
}

return M
