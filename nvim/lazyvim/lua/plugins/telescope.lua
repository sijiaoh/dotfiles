local Util = require("lazyvim.util")

return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      -- Use <leader><space> to Leap.
      { "<leader><space>", nil },
      -- CtrlP like keybind.
      { "<C-p>", Util.pick("files"), desc = "Find Files (root dir)" },
    },
  },
}
