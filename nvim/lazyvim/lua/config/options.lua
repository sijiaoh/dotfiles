-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Fix typed `.` will break indentation in ruby file.
-- From: https://github.com/nvim-treesitter/nvim-treesitter/issues/2566#issuecomment-1544822821
vim.cmd([[autocmd FileType ruby setlocal indentkeys-=.]])

-- Add .marksman.toml to root markers.
-- Because Marksman hard-coded the marker.
vim.g.root_spec = { { ".marksman.toml", ".project_root" }, "lsp", { ".git", "lua" }, "cwd" }

-- Turn off Chinese, Japanese, Korean spell check.
vim.opt.spelllang:append("cjk")

-- From: https://mise.jdx.dev/ide-integration.html#neovim
-- Prepend mise shims to PATH
vim.env.PATH = vim.env.HOME .. "/.local/share/mise/shims:" .. vim.env.PATH

-- Tmux内ではTmuxのクリップボードを使用する
if vim.env.TMUX ~= nil then
  vim.opt.clipboard = "unnamedplus"
  local copy = { "tmux", "load-buffer", "-w", "-" }
  -- OSC52のクリップボード同期を待つ必要がある
  local paste = { "bash", "-c", "tmux refresh-client -l && sleep 0.1 && tmux save-buffer -" }
  vim.g.clipboard = {
    name = "tmux",
    copy = {
      ["+"] = copy,
      ["*"] = copy,
    },
    paste = {
      ["+"] = paste,
      ["*"] = paste,
    },
    cache_enabled = 0,
  }
end

-- 重すぎるため無効化
-- https://github.com/Shopify/ruby-lsp/issues/2446
vim.g.lazyvim_ruby_lsp = "disable"

-- なぜかターミナルのインサートモードで点滅するようになったため、それを防ぐ
vim.opt.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20,t:block-TermCursor"
