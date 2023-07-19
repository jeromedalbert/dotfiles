local lspconfig = require('lspconfig')

lspconfig.syntax_tree.setup {
  root_dir = lspconfig.util.root_pattern('.streerc')
}
