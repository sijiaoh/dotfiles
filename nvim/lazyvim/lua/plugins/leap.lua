return {
  -- From: http://www.lazyvim.org/extras/editor/leap#leapnvim
  {
    "ggandor/leap.nvim",
    enabled = true,
    opts = {
      -- Remove s key from labels.
      -- From `:help leap.opts.safe_labels`
      safe_labels = "fnut/FNLHMUGTZ?",
      labels = "fnjklhodweimbuyvrgtaqpcxz/FNJKLHODWEIMBUYVRGTAQPCXZ?",
    },
    keys = {
      -- EasyMotion like keybinds.
      { "<leader><space>f", "<Plug>(leap-forward)", desc = "Leap forward to" },
      { "<leader><space>F", "<Plug>(leap-backward)", desc = "Leap backward to" },
      { "<leader><space>g", "<Plug>(leap-from-window)", desc = "Leap from window" },
    },
    config = function(_, opts)
      local leap = require("leap")
      for k, v in pairs(opts) do
        leap.opts[k] = v
      end
      vim.keymap.del({ "x", "o" }, "x")
      vim.keymap.del({ "x", "o" }, "X")
    end,
  },
}
