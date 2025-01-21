return {
  "snacks.nvim",
  opts = {
    terminal = {
      win = {
        keys = {
          -- C-hjklはターミナル内で普通に使う
          nav_h = { "<C-h>", false },
          nav_j = { "<C-j>", false },
          nav_k = { "<C-k>", false },
          nav_l = { "<C-l>", false },
        },
      },
    },
  },
}
