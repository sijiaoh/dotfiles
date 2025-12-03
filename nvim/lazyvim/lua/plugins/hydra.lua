return {
  {
    "mrjones2014/smart-splits.nvim",
    lazy = true,
  },
  {
    "nvimtools/hydra.nvim",
    dependencies = { "mrjones2014/smart-splits.nvim" },
    keys = {
      { "<C-w><C-h>", desc = "Resize left" },
      { "<C-w><C-j>", desc = "Resize down" },
      { "<C-w><C-k>", desc = "Resize up" },
      { "<C-w><C-l>", desc = "Resize right" },
    },
    config = function()
      local Hydra = require("hydra")
      local splits = require("smart-splits")

      Hydra({
        name = "Resize",
        mode = "n",
        body = "<C-w>",
        config = {
          timeout = 3000,
        },
        heads = {
          { "<C-h>", function() splits.resize_left(5) end },
          { "<C-l>", function() splits.resize_right(5) end },
          { "<C-j>", function() splits.resize_down(3) end },
          { "<C-k>", function() splits.resize_up(3) end },
        },
      })
    end,
  },
}
