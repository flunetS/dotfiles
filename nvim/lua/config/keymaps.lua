-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Paste without copiying changed code
vim.api.nvim_set_keymap("x", "<leader>p", '"_dP', { noremap = true, desc = "Paste" })
