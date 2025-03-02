return {
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    -- stylua: ignore
    keys = {
      { "s", mode={ "n", "x", "o" }, false },
      { "S", mode={ "n", "x", "o" }, false },
      { "<leader><space>f", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      { "<leader><space>F", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    },
    opts = {
      highlight = { backdrop = false },
      modes = {
        search = {
          highlight = { backdrop = false },
        },
        char = {
          char_actions = function()
            return {
              [";"] = "next", -- set to `right` to always go right
              [","] = "prev", -- set to `left` to always go left

              -- Disable repeat motion keys
              -- [motion:lower()] = "next",
              -- [motion:upper()] = "prev",
            }
          end,
          highlight = { backdrop = false },
        },
        treesitter = {
          highlight = { backdrop = false },
        },
      },
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
