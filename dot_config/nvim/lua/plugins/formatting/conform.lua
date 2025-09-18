return {
  {
    'stevearc/conform.nvim',
    opts = {
      formatters_by_ft = {
        lua = { 'stylua' },

        python = { 'autopep8' },
        javascript = {
          'biome_c',
          'eslint_c',
          'prettier',
          stop_after_first = true,
        },
        javascriptreact = {
          'biome_c',
          'eslint_c',
          'prettier',
          stop_after_first = true,
        },
        typescript = {
          'biome_c',
          'eslint_c',
          'prettier',
          stop_after_first = true,
        },
        typescriptreact = {
          'biome_c',
          'eslint_c',
          'prettier',
          stop_after_first = true,
        },
        mdx = { 'prettier' },
        markdown = { 'prettier' },
        json = { 'biome_c', 'prettier', stop_after_first = true },
        astro = { 'prettier' },
        css = { 'prettier' },
        html = { 'prettier' },
        jsonc = { 'biome_c', 'prettier', stop_after_first = true },
      },
    },
  },
}
