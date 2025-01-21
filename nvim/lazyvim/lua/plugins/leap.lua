return {
  {
    "ggandor/leap.nvim",
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
  },
}
