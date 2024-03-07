-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])
vim.opt.number = true -- Number in front of each line
vim.opt.list = true -- Show space, line breaks, spaces, tabs...
vim.opt.confirm = true -- Confirm before closing an unsaved buffer
vim.opt.cursorline = true -- Highlight current line
vim.opt.relativenumber = false -- Disable relative numbers on lines
vim.opt.listchars:append("eol:↴") -- Set the sign for the EOL
vim.opt.wrap = false -- Long lines are not wrapped
vim.opt.signcolumn = "yes" --
