-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap
-- Delete a word backwards
keymap.set("n", "dw", 'vb"_d')
--Resize window
-- keymap.set("n", "<C-w><left>", "<C-w><", { desc = "Increase window height", silent = true })
