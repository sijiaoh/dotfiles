-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Fix typed `.` will break indentation in ruby file.
-- From: https://github.com/nvim-treesitter/nvim-treesitter/issues/2566#issuecomment-1544822821
vim.cmd([[autocmd FileType ruby setlocal indentkeys-=.]])

-- Add .marksman.toml to root markers.
-- Because Marksman hard-coded the marker.
vim.g.root_spec = { { ".marksman.toml" }, "lsp", { ".git", "lua" }, "cwd" }

-- Turn off Chinese, Japanese, Korean spell check.
vim.opt.spelllang:append("cjk")
