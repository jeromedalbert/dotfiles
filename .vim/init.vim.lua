local lspconfig = require('lspconfig')
local lspformat = require('lsp-format')
lspformat.setup {}
lspconfig.syntax_tree.setup {
  root_dir = lspconfig.util.root_pattern('.streerc'),
  on_attach = lspformat.on_attach
}

-- local util = require 'formatter.util'
-- require('formatter').setup {
--   filetype = {
--     ruby = {
--       function()
--         return {
--           exe = 'stree',
--           args = {
--             'write'
--           },
--         }
--       end
--     },
--   }
-- }
