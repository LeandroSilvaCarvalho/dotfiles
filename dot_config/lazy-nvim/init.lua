vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.have_nerd_font = true

-- -- init.lua
-- local null_ls = require 'null-ls'
--
-- null_ls.setup {
--   sources = {
--     null_ls.builtins.formatting.eslint_d, -- plus rapide qu'eslint classique
--   },
-- }

require 'globals'
require 'options'
require 'keymaps'
require 'lazy-init'
