require('luasnip.loaders.from_lua').load {
  paths = { '~/.config/nvim/lua/snippets' },
}

require('luasnip').filetype_extend('typescriptreact', { 'reactts' })
