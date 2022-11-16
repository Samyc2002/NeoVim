local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions
local completions = null_ls.builtins.code_actions
local hover = null_ls.builtins.hover

null_ls.setup({
	debug = false,
	sources = {
		-- Formatters
		formatting.prettier.with({
			extra_args = {
				"--print-with",
				"100",
				"--tab-width",
				"2",
				"--use-tabs",
				"false",
				"--semi",
				"true",
				"--single-quote",
				"false",
				"--trailing-comma",
				"none",
				"--end-of-line",
				"auto",
			},
		}),
		formatting.black.with({ extra_args = { "--fast" } }),
		formatting.stylua,
		formatting.clang_format,
		--[[ formatting.eslint, ]]
		formatting.eslint_d,
		formatting.google_java_format,
		formatting.lua_format,
		formatting.markdownlint,
		formatting.markdown_toc,
		-- Hover
		hover.dictionary,
		hover.printenv,
		-- Diagnostics
		--[[ diagnostics.cspell, ]]
		diagnostics.clang_check,
		diagnostics.commitlint,
		diagnostics.cppcheck,
		diagnostics.cpplint,
		--[[ diagnostics.cslint, ]]
		--[[ diagnostics.eslint, ]]
		--[[ diagnostics.eslint_d.with({ ]]
		--[[ 	diagnostics_format = "[eslint] #{m}\n(#{c})", ]]
		--[[ }), ]]
		diagnostics.flake8,
		diagnostics.hadolint,
		diagnostics.jsonlint,
		--[[ diagnostics.luacheck, ]]
		diagnostics.markdownlint,
		diagnostics.pylint,
		diagnostics.stylint,
		diagnostics.tidy,
		diagnostics.tsc,
		diagnostics.zsh,
		-- Code Actions
		--[[ code_actions.cspell, ]]
		--[[ code_actions.eslint, ]]
		code_actions.eslint_d,
		code_actions.gitsigns,
		code_actions.proselint,
		--[[ code_actions.spellcheck, ]]
		--[[ completions.luasnip, ]]
		--[[ completions.tags, ]]
	},
})
