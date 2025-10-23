vim.lsp.config('syntax_tree', {
  root_dir = function(bufnr, on_dir)
    if vim.fs.root(bufnr, '.streerc') then on_dir(vim.fn.getcwd()) end
  end,
})
vim.lsp.config('rubocop', {
  cmd = { 'bundle', 'exec', 'rubocop', '--lsp' },
  root_dir = function(bufnr, on_dir)
    if vim.fs.root(bufnr, '.rubocop.yml') then on_dir(vim.fn.getcwd()) end
  end,
  handlers = {
    ['textDocument/publishDiagnostics'] = function() end,
  },
})
vim.lsp.enable({ 'syntax_tree', 'rubocop' })

require('conform').setup({
  format_on_save = {
    timeout_ms = 500,
    lsp_format = 'fallback',
  },
  formatters_by_ft = {
    go = { 'gofmt' },
    javascript = { 'prettier' },
    javascriptreact = { 'prettier' },
    lua = { 'stylua' },
    -- python = { 'black' },
    ruby = { lsp_format = 'prefer' },
    sh = { 'shfmt' },
    typescript = { 'prettier' },
    typescriptreact = { 'prettier' },
  },
  formatters = {
    prettier = {
      require_cwd = true,
      cwd = require('conform.util').root_file({
        '.prettierignore',
      }),
    },
  },
})
