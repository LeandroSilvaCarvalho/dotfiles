return {
  "catppuccin/nvim",
  tag = "v1.6.0",
  lazy = false,
  config = function()
    local catppuccin = require("catppuccin")

    catppuccin.setup({
      flavour = "mocha",
      transparent_background = false,
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        notify = false,
        mini = {
          enabled = true,
          indentscope_color = "",
        },
        telescope = {
          enabled = true,
        },
      },
    })

    vim.cmd("colorscheme catppuccin")
  end,
}
