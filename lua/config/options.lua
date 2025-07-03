-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.autoformat = false
vim.g.mapleader = ","
vim.opt.listchars = {
  tab = "▸ ",     -- tab 顯示為 ▸ 後接一個空格
  space = "·",    -- space 顯示為 ·
  trail = "~",    -- 行尾空白顯示為 ~
  extends = "»",  -- 捲動超出畫面時右側顯示為 »
  precedes = "«"  -- 捲動超出畫面時左側顯示為 «
}


