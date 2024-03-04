vim.g.mapleader = " "

vim.opt.number = true
vim.opt.clipboard = "unnamedplus" -- Use system clipboard.
vim.opt.termguicolors = true

function register_to_space_panel(opts)
  local wk = require("which-key")
  wk.register(opts, { prefix = "<leader>" })
end

plugins = {
  -- Utilities.
  "tpope/vim-surround",
  {
    "ggandor/leap.nvim",
    opts = {
      -- Remove s key from labels.
      safe_labels = 'fnut/FNLHMUGTZ?',
      labels = 'fnjklhodweimbuyvrgtaqpcxz/FNJKLHODWEIMBUYVRGTAQPCXZ?',
    },
    config = function()
      register_to_space_panel({
        ["<leader>"] = {
          name = "Leap",
          f = { "<Plug>(leap-forward)", "Forward" },
          F = { "<Plug>(leap-backward)", "Backward" },
          g = { "<Plug>(leap-from-window)", "From window" },
        },
      })
    end,
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

  -- AI.
  -- Run `:Copilot setup` when first installed.
  "github/copilot.vim",

  -- Spacemacs-like keybindings.
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    config = function()
      register_to_space_panel({
        ["b"] = {
          name = "Buffer",
          h = { ":bprev<CR>", "Previous buffer" },
          l = { ":bnext<CR>", "Next buffer" },
        },
      }, { prefix = "<leader>" })

      register_to_space_panel({
        ["w"] = {
          name = "Window",
          j = { "<C-W>j", "Move to window below" },
          k = { "<C-W>k", "Move to window above" },
          h = { "<C-W>h", "Move to window on the left" },
          l = { "<C-W>l", "Move to window on the right" },
          v = { "<C-W>v", "Split window vertically" },
          s = { "<C-W>s", "Split window horizontally" },
        },
      }, { prefix = "<leader>" })
    end,
  },

  -- File tree.
  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      require("nvim-tree").setup()

      register_to_space_panel({
        ["e"] = {
          name = "Explorer",
          e = { ":NvimTreeToggle<CR>", "Toggle" },
          t = { ":NvimTreeToggle<CR>", "Toggle" },
          r = { ":NvimTreeRefresh<CR>", "Refresh" },
          f = { ":NvimTreeFindFile<CR>", "Find file" },
          c = { ":NvimTreeCollapse<CR>", "Collapse" },
        },
      })
    end,
  },
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
