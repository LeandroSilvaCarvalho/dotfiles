return {
  "catppuccin/nvim",
  tag = "v1.6.0",
  lazy = false,
  config = function()
    local catppuccin = require("catppuccin")

    catppuccin.setup({
      flavour = "mocha",
      transparent_background = false,
    })

    vim.cmd("colorscheme catppuccin")
  end,
}
