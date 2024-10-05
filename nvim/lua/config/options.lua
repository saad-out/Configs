-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Set tabs to 4 spaces
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true -- Convert tabs to spaces

-- Enable numbered lines
vim.opt.number = true
vim.opt.relativenumber = true -- Optional: relative numbers

-- Set the leader key to space
vim.g.mapleader = " "

-- Enable 24-bit RGB colors
vim.opt.termguicolors = true
