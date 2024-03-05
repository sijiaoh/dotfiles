-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Unmap C-hjkl in terminal.
vim.cmd([[
  tunmap <C-h>
  tunmap <C-j>
  tunmap <C-k>
  tunmap <C-l>
]])
