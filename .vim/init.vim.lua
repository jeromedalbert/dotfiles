local lspconfig = require('lspconfig')
local lspformat = require('lsp-format')
lspformat.setup {}
lspconfig.syntax_tree.setup {
  root_dir = lspconfig.util.root_pattern('.streerc'),
  on_attach = lspformat.on_attach
}

require('nvim-treesitter.configs').setup {
  ensure_installed = "all",
  highlight = {
    enable = true,
    disable = { "csv" },
    additional_vim_regex_highlighting = false
  }
}
