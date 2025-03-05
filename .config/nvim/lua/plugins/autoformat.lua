vim.api.nvim_create_autocmd('BufEnter', {
  pattern = { '*.ml', '*.mli' },
  group = vim.api.nvim_create_augroup('OCamlFormatting', { clear = true }),
  callback = function()
    print 'autcmd setting shiftwidth'
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2
  end,
})

-- Autoformat
return {
  {
    'stevearc/conform.nvim',
    opts = {
      format_on_save = {
        lsp_fallback = true,
      },
      formatters_by_ft = {
        lua = { 'stylua' },
        javascript = { 'prettier' },
        typescript = { 'prettier' },
        vue = { 'prettier' },
        python = { 'black' },
        go = { 'goimports' },
        ocaml = { 'ocamlformat' },
        ruby = { 'rubocop' },
        eruby = { 'erb-formatter' },
      },
    },
  },
}
