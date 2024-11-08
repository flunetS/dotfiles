-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Navigating buffers
-- vim.api.nvim_set_keymap('n', '<S-Tab>', ':bprev<CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<Tab>', ':bnext<CR>', { noremap = true, silent = true })

-- Paste without copiying changed code
vim.api.nvim_set_keymap('x', '<leader>p', "\"_dP", { noremap = true, desc = "Paste" })

-- -- Show floating diagnostic for the current line
-- vim.api.nvim_set_keymap('n', '<C-k>', ":lua vim.diagnostic.open_float()<CR>", { noremap = true, silent = true })