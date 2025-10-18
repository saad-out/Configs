-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
vim.api.nvim_set_keymap("n", "<Leader>t", ":terminal<CR>", { noremap = true, silent = true })

-- Copilot
-- Disable default <Tab> mapping
vim.g.copilot_no_tab_map = true
-- Map <C-j> to accept Copilot suggestion
vim.api.nvim_set_keymap("i", "<C-j>", 'copilot#Accept("<CR>")', { expr = true, silent = true, noremap = true })
