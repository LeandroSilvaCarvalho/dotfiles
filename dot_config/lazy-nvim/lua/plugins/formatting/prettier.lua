local supported = {
  'css',
  'graphql',
  'handlebars',
  'html',
  'javascript',
  'javascriptreact',
  'json',
  'jsonc',
  'less',
  'markdown',
  'markdown.mdx',
  'scss',
  'typescript',
  'typescriptreact',
  'vue',
  'yaml',
}

return {
  {
    'williamboman/mason.nvim',
    opts = { ensure_installed = { 'prettier' } },
  },

  -- conform
  {
    'stevearc/conform.nvim',
    optional = true,
    opts = function(_, opts)
      opts.formatters_by_ft = opts.formatters_by_ft or {}
      for _, ft in ipairs(supported) do
        opts.formatters_by_ft[ft] = opts.formatters_by_ft[ft] or {}
        table.insert(opts.formatters_by_ft[ft], 'prettier')
        table.insert(opts.formatters_by_ft[ft], 'prettierd')
      end

      opts.format_after_save = function(bufnr)
        -- Disable formatting if global or buffer-local variable is set
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
          return
        end
        -- Check if the filetype supports `prettier`
        local filetype = vim.bo[bufnr].filetype

        if vim.tbl_contains(supported, filetype) then
          return { formatters = { 'prettier' }, timeout_ms = 2000 }
        end

        -- Fallback to default LSP formatting
        return { lsp_format = 'fallback' }
      end
    end,
  },

  -- none-ls support
  {
    'nvimtools/none-ls.nvim',
    optional = true,
    opts = function(_, opts)
      local nls = require 'null-ls'
      opts.sources = vim.list_extend(opts.sources or {}, {
        -- ESLint au formatage, équivalent à VS Code + eslint
        nls.builtins.formatting.eslint_d,
        -- (optionnel) actions de code ESLint (fix via code actions)
        nls.builtins.code_actions.eslint_d,
        -- tu peux garder les autres formatters par défaut si tu veux
      })
      -- opts.sources = opts.sources or {}
      table.insert(opts.sources, nls.builtins.formatting.prettier)
    end,
  },
}
