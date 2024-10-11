require('nvim-treesitter.install').prefer_git = true
require 'nvim-treesitter.configs'.setup {
    ensure_installed = { 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'vim', 'vimdoc', 'javascript', 'rust', 'typescript', "comment" },
    -- Autoinstall languages that are not installed
    auto_install = true,
    highlight = {
        enable = true,
        -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
        --  If you are experiencing weird indenting issues, add the language to
        --  the list of additional_vim_regex_highlighting and disabled languages for indent.
        additional_vim_regex_highlighting = { 'ruby' },
    },
    --[[ rainbow = { ]]
    --[[     enable = true, ]]
    --[[     -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for ]]
    --[[     extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean ]]
    --[[     max_file_lines = nil, -- Do not enable for files with more than n lines, int ]]
    --[[     -- colors = {}, -- table of hex strings ]]
    --[[     -- termcolors = {} -- table of colour name strings ]]
    --[[ }, ]]
    indent = { enable = true, disable = { 'ruby' } },
}
