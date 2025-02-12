-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- ターミナル終了時に`[Process exited 1]`などで止まらないようにする
-- From: https://github.com/neovim/neovim/issues/14986#issuecomment-902705190
vim.cmd(":autocmd TermClose * execute 'bdelete! ' . expand('<abuf>')")
