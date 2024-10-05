-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Mapping to open terminal
vim.api.nvim_set_keymap("n", "<Leader>t", ":terminal<CR>", { noremap = true, silent = true })
