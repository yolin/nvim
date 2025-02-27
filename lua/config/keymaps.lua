-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.g.mapleader = ","
-- NERDTreeToggle
vim.keymap.set("n", "<F1>", "<ESC>:Neotree toggle<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>aq", "<ESC>:qa<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<F4>", "<ESC>:set expandtab!<CR>", { noremap = true, silent = true })
vim.keymap.set("v", "<C-x>", '"+x', { noremap = true, silent = true })
vim.keymap.set("v", "<C-c>", '"+y', { noremap = true, silent = true })
vim.keymap.set("v", "<C-v>", '"+p', { noremap = true, silent = true })
