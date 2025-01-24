return {
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    -- stylua: ignore
    keys = {
      { "s", mode={ "n", "x", "o" }, false },
      { "S", mode={ "n", "x", "o" }, false },
      { "<leader><space>f", mode = { "n" }, function() require("flash").jump() end, desc = "Flash" },
      { "<leader><space>F", mode = { "n" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    },
  },
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        { "<leader><space>", group = "flash" },
      },
    },
  },
}
