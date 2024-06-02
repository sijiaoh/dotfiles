vim.g.mapleader = " "

vim.opt.number = true
vim.opt.clipboard = "unnamedplus" -- Use system clipboard.
vim.opt.termguicolors = true -- Enable true color support.
vim.opt.ignorecase = true -- Ignore case when searching.

plugins = {
  -- Utilities.
  "tpope/vim-surround",
  {
    'phaazon/hop.nvim',
    branch = 'v2', -- optional but strongly recommended
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }

      -- place this in one of your configuration file(s)
      local hop = require('hop')
      local directions = require('hop.hint').HintDirection
      vim.keymap.set('', '  f', function()
        hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = false })
      end, {remap=true})
      vim.keymap.set('', '  F', function()
        hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = false })
      end, {remap=true})
    end
  },
  {
    "kien/ctrlp.vim",
    config = function()
      vim.g.ctrlp_show_hidden = 1
    end,
  },

  -- Color scheme.
  {
    "dracula/vim",
    config = function()
      vim.cmd("colorscheme dracula")
    end,
  },

  -- File tree.
  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      require("nvim-tree").setup()
      vim.keymap.set("", " ee", ":NvimTreeToggle<CR>")
      vim.keymap.set("", " et", ":NvimTreeToggle<CR>")
      vim.keymap.set("", " er", ":NvimTreeRefresh<CR>")
      vim.keymap.set("", " ec", ":NvimTreeFindFile<CR>")
      vim.keymap.set("", " ec", ":NvimTreeCollapse<CR>")
    end,
  },
}

-- lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
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
