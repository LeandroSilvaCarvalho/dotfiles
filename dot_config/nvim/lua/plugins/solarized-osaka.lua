return {
  "craftzdog/solarized-osaka.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    local solarized = require("solarized-osaka")

    solarized.setup({
      transparent_background = true,
    })
    vim.cmd("colorscheme solarized-osaka")
  end,
}
