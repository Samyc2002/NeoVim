local lsp_zero = require('lsp-zero')
local cmp_lsp = require("cmp_nvim_lsp")

lsp_zero.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    if client.name == "tsserver" then
        client.server_capabilities.document_formatting = false
    end
    lsp_zero.default_keymaps({ buffer = bufnr })
end)

local capabilities = vim.tbl_deep_extend(
    "force",
    {},
    vim.lsp.protocol.make_client_capabilities(),
    cmp_lsp.default_capabilities()
)

-- to learn how to use mason.nvim
-- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guide/integrate-with-mason-nvim.md
require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {
        "lua_ls",
        "tsserver",
        "eslint",
        "rust_analyzer"
    },
    handlers = {
        function(server_name)
            local opts = {}
            if server_name == "tsserver" then
                opts.settings = {
                    implicitProjectConfiguration = {
                        checkJs = true
                    },
                }
            end

            opts.capabilities = capabilities

            require('lspconfig')[server_name].setup(opts)
        end,
    },
})

local cmp = require("cmp")
local luasnip = require('luasnip')
luasnip.config.setup {}
local cmp_mappings = cmp.mapping.preset.insert({
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-k>"] = cmp.mapping.select_prev_item(),
    ["<C-j>"] = cmp.mapping.select_next_item(),
    ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
    ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
    ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ["<C-e>"] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
    }),
    -- Accept currently selected item. If none selected, `select` first item.
    -- Set `select` to `false` to only confirm explicitly selected items.
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
    ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
            cmp.select_next_item()
        else
            fallback()
        end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
            cmp.select_prev_item()
        else
            fallback()
        end
    end, { "i", "s" }),
})

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    completion = { completeopt = 'menu,menuone,noinsert' },
    mapping = cmp_mappings,
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'path' },
    },
})

local status, prettier = pcall(require, "prettier")
if not status then
    return
end

prettier.setup({
    bin = "prettierd",
    filetypes = {
        "css",
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "json",
        "scss",
        "less",
    },
})
