-- return
--   {
--     'scottmckendry/cyberdream.nvim',
--     lazy = false,
--     priority = 1000,
--     config = function()
--       require('cyberdream').setup {
--         transparent = true,
--         italic_comments = true,
--         borderless_pickers = false,
--       }
--       vim.cmd [[colorscheme cyberdream]]
--     end,
--   },
-- }
return {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000,
  lazy = false,
  config = function()
    local catppuccin = require 'catppuccin'

    catppuccin.setup {
      flavour = 'mocha',
      transparent_background = false,
      integrations = {
        nvim_bufferline = true,
        nvim_tree = true,
        cmp = true,
        gitsigns = true,
        telescope = true,
        notify = false,
        mini = true,
        -- nvim_dap = true,
      },
    }

    vim.cmd 'colorscheme catppuccin'
  end,
}
-- return {
--   'ellisonleao/gruvbox.nvim',
--   priority = 1000,
--   enabled = true,
--   lazy = false,
--   config = function()
--     local gruvbox = require 'gruvbox'
--     gruvbox.setup {}
--
--     vim.o.background = 'light'
--     vim.cmd 'colorscheme gruvbox'
--   end,
-- }

-- return {
--   'craftzdog/solarized-osaka.nvim',
--   lazy = false,
--   priority = 1000,
--   opts = {},
-- }

-- return {
--   {
--     'ellisonleao/gruvbox.nvim',
--     priority = 1000,
--     lazy = false,
--   },
--   {
--     'craftzdog/solarized-osaka.nvim',
--     priority = 1000,
--     lazy = false,
--   },
--   {
--     -- Choix du thème selon le terminal
--     'nvim-lua/plenary.nvim', -- plugin factice juste pour le bloc config
--     priority = 999,
--     lazy = false,
--     config = function()
--       local term_prog = vim.env.TERM_PROGRAM or ''
--       local term = vim.env.TERM or ''
--
--       -- Vérifie si c'est Ghostty (souvent TERM_PROGRAM ou TERM)
--       -- local is_ghostty = term_prog:lower():match 'ghostty' or term:lower():match 'ghostty'
--
--       -- Vérifie si c'est iTerm2
--       local is_iterm = term_prog:lower():match 'iterm'
--
--       if is_iterm then
--         vim.o.background = 'dark'
--         vim.cmd 'colorscheme solarized-osaka'
--       else
--         vim.o.background = 'light'
--         vim.cmd 'colorscheme gruvbox'
--       end
--     end,
--   },
-- }
