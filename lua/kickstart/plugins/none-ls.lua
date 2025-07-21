return {
  'nvimtools/none-ls.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local null_ls = require 'null-ls'

    null_ls.setup {
      sources = {
        null_ls.builtins.formatting.prettier.with {
          command = 'prettierd',
          filetypes = {
            'javascript',
            'typescript',
            'javascriptreact',
            'typescriptreact',
            'json',
            'yaml',
            'html',
            'css',
            'markdown',
            'graphql',
            'vue',
            'svelte',
          },
        },
      },
    }

    -- Auto format on save
    vim.api.nvim_create_autocmd('BufWritePre', {
      pattern = '*',
      callback = function()
        vim.lsp.buf.format { async = false }
      end,
    })
  end,
}
