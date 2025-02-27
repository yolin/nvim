-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- NERDTreeToggle
vim.keymap.set("n", "<F1>", "<ESC>:Neotree toggle<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>aq", "<ESC>:qa<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<F4>", "<ESC>:set expandtab!<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<F8>", "<ESC>:BufferLinePick<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>jj ", "<c-w>j", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>kk", "<c-w>k", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>hh", "<c-w>h", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>ll", "<c-w>l", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>q", "<ESC>:BufferLineGroupToggle close<CR>:BufferLineMovePrev<CR>:BufferLineCycleNext<CR>:BufferLineGroupClose close<CR>", { noremap = true, silent = true })
vim.keymap.set("v", "<C-x>", '"+x', { noremap = true, silent = true })
vim.keymap.set("v", "<C-c>", '"+y', { noremap = true, silent = true })
vim.keymap.set("v", "<C-v>", '"+p', { noremap = true, silent = true })


vim.o.tabstop = 4
vim.o.expandtab = true
vim.o.softtabstop = 4
vim.o.shiftwidth = 4

vim.keymap.set("n", "<C-j>", ":Gitsigns next_hunk<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-k>", ":Gitsigns prev_hunk<CR>", { noremap = true, silent = true })
