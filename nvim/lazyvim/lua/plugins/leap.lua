return {
  {
    "ggandor/leap.nvim",
    keys = {
      -- EasyMotion like keybinds.
      { "<leader><space>f", "<Plug>(leap-forward)", desc = "Leap forward to" },
      { "<leader><space>F", "<Plug>(leap-backward)", desc = "Leap backward to" },
      { "<leader><space>g", "<Plug>(leap-from-window)", desc = "Leap from window" },
    },
    init = function()
      -- Do not customize sSfF.
      vim.cmd("unmap s")
      vim.cmd("unmap S")
      vim.cmd("unmap f")
      vim.cmd("unmap F")
    end,
  },
}
