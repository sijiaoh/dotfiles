vim.g.mapleader = " "

vim.opt.number = true
vim.opt.clipboard = "unnamedplus" -- Use system clipboard.

plugins = {
  -- Utilities.
  "tpope/vim-surround",
  "easymotion/vim-easymotion",
  "kien/ctrlp.vim",

  -- Color scheme.
  {
    "nanotech/jellybeans.vim",
    config = function()
      vim.cmd("colorscheme jellybeans")
    end,
  },

  -- AI.
  -- Run `:Copilot setup` when first installed.
  "github/copilot.vim"
}

-- lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup(plugins)
