-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

-- Emacs like keybindings
map({ "i", "c" }, "<C-p>", "<Up>")
map({ "i", "c" }, "<C-n>", "<Down>")
map({ "i", "c" }, "<C-f>", "<Right>")
map({ "i", "c" }, "<C-b>", "<Left>")
map({ "i", "c" }, "<C-a>", "<Home>")
map({ "i", "c" }, "<C-e>", "<End>")
map({ "i", "c" }, "<C-h>", "<BS>")
map({ "i", "c" }, "<C-d>", "<Del>")

-- Use C-w in terminal mode
map("t", "<C-w>", [[<C-\><C-n><C-w>]], { noremap = true, silent = true })
