return {
  'nvim-lualine/lualine.nvim',
  config = function()
    local lualine = require 'lualine'

    -- Détection du terminal
    local term_prog = vim.env.TERM_PROGRAM or ''
    local term = vim.env.TERM or ''

    local is_iterm = term_prog:lower():match 'iterm'
    -- local is_ghostty = term_prog:lower():match 'ghostty'
    -- or term:lower():match 'ghostty'

    -- Choix du thème lualine selon le terminal
    -- local lualine_theme = is_ghostty and 'gruvbox' or 'solarized_dark'
    -- local lualine_theme = is_iterm and 'solarized_dark' or 'gruvbox'
    local lualine_theme = 'catppuccin'

    -- Custom section definitions
    local lint_progress = function()
      local linters = require('lint').get_running()
      if #linters == 0 then
        return '󰦕'
      end
      return '󱉶 ' .. table.concat(linters, ', ')
    end

    lualine.setup {
      options = {
        icons_enabled = true,
        theme = lualine_theme,
        disabled_filetypes = { 'lazygit' },
        always_divide_middle = true,
        globalstatus = true,
        -- section_separators = { left = '', right = '' },
        -- component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' },
        -- component_separators = { left = '', right = '' },
        -- section_separators = { left = '', right = '' },
        -- component_separators = { left = '', right = '' },
        -- section_separators = { left = '', right = '' },
        -- section_separators = { left = '', right = '' },
        -- component_separators = { left = '', right = '' },
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = {},
        lualine_x = {},
        lualine_y = { lint_progress },
        lualine_z = { 'fileformat', 'filetype' },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
      extensions = {},
    }
  end,
}
