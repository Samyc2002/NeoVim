local status_ok, mason_lsp = pcall(require, "mason-lspconfig")
if not status_ok then
	return
end

mason_lsp.setup({
	ensure_installed = { "sumneko_lua", "jsonls", "pyright" },
})

local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("nvim.lsp.lsp-installer")
require("nvim.lsp.handlers").setup()
require("nvim.lsp.null-ls")
require("nvim.lsp.prettier")
