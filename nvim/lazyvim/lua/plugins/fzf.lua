local Util = require("lazyvim.util")

return {
  {
    "ibhagwan/fzf-lua",
    keys = {
      -- Use <leader><space> to Leap.
      { "<leader><space>", nil },
      -- CtrlP like keybind.
      { "<C-p>", Util.pick("files"), desc = "Find Files (root dir)" },
    },
  },
}
