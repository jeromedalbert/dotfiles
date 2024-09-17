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
    auto_suggestions = false,
    auto_set_highlight_group = true,
    auto_set_keymaps = true,
    auto_apply_diff_after_generation = false,
    support_paste_from_clipboard = false,
  }
}

require('avante_lib').load()
require('avante').setup {
  provider = "openai",
  behaviour = {
    -- auto_suggestions = false,
    auto_set_keymaps = false,
  },
  hints = {
    enabled = false
  }
}
