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
    opts = function()
      local fzf = require("fzf-lua")
      local config = fzf.config

      -- Emacs like keybindings
      config.defaults.keymap.fzf["ctrl-f"] = "forward-char"
      config.defaults.keymap.fzf["ctrl-b"] = "backward-char"
      config.defaults.keymap.fzf["ctrl-d"] = "delete-char"
      config.defaults.keymap.builtin["<c-f>"] = false
      config.defaults.keymap.builtin["<c-b>"] = false
    end,
  },
}
