return {
  "nvimdev/dashboard-nvim",
  event = "VimEnter",
  config = function()
    local logo = [[
██╗     ███████╗ █████╗ ███╗   ██╗██████╗ ██████╗  ██████╗               ██╗     ███████╗██╗     ███████╗
██║     ██╔════╝██╔══██╗████╗  ██║██╔══██╗██╔══██╗██╔═══██╗              ██║     ██╔════╝██║     ██╔════╝
██║     █████╗  ███████║██╔██╗ ██║██║  ██║██████╔╝██║   ██║    █████╗    ██║     █████╗  ██║     █████╗  
██║     ██╔══╝  ██╔══██║██║╚██╗██║██║  ██║██╔══██╗██║   ██║    ╚════╝    ██║     ██╔══╝  ██║     ██╔══╝  
███████╗███████╗██║  ██║██║ ╚████║██████╔╝██║  ██║╚██████╔╝              ███████╗███████╗███████╗███████╗
╚══════╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═════╝ ╚═╝  ╚═╝ ╚═════╝               ╚══════╝╚══════╝╚══════╝╚══════╝
      ]]
    logo = string.rep("\n", 8) .. logo .. "\n\n"
    require("dashboard").setup({
      config = {
        header = vim.split(logo, "\n"),
        project = {
          enable = true,
          limit = 4,
          icon = "  ",
          label = "Recent projects:",
          action = "Neotree toggle position=float dir=",
        },
      },
    })
  end,
  dependencies = {
    { "nvim-tree/nvim-web-devicons" },
  },
}
