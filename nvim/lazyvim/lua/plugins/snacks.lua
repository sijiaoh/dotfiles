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
    picker = {
      win = {
        input = {
          keys = {
            ["<c-f>"] = false,
            ["<c-b>"] = false,
            ["<c-a>"] = false,
            ["<c-e>"] = false,
            ["<c-h>"] = false,
            ["<c-d>"] = false,
            -- <option-,>
            ["≤"] = { "toggle_ignored", mode = { "i", "n" } },
            -- <option-.>
            ["≥"] = { "toggle_hidden", mode = { "i", "n" } },
            -- <option-?>
            ["÷"] = { "toggle_follow", mode = { "i", "n" } },
          },
        },
      },
      sources = {
        files = {
          hidden = true,
        },
      },
    },
    lazygit = {
      win = {
        bo = {
          filetype = "lazygit",
        },
      },
    },
  },
}
