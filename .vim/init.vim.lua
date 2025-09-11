local lspconfig = require('lspconfig')
lspconfig.syntax_tree.setup({
  root_dir = lspconfig.util.root_pattern('.streerc'),
})
lspconfig.rubocop.setup({
  cmd = { 'bundle', 'exec', 'rubocop', '--lsp' },
  root_dir = lspconfig.util.root_pattern('.rubocop.yml'),
  handlers = {
    ['textDocument/publishDiagnostics'] = function() end,
  },
})

require('conform').setup({
  format_on_save = {
    timeout_ms = 500,
    lsp_format = 'fallback',
  },
  formatters_by_ft = {
    go = { 'gofmt' },
    -- javascript = { 'prettier' },
    lua = { 'stylua' },
    -- python = { 'black' },
    ruby = { lsp_format = 'prefer' },
    sh = { 'shfmt' },
  },
})

-- require('nvim-treesitter.configs').setup {
--   ensure_installed = "all",
--   highlight = {
--     enable = true,
--     disable = { "csv", "bash" },
--     additional_vim_regex_highlighting = false,
--   },
--   indent = { enable = true }
-- }
