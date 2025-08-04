return {
  {
    "potamides/pantran.nvim",
    config = function()
      local pantran = require("pantran")
      pantran.setup({
        default_engine = "google",
        engines = {
          google = {
            fallback = {
              default_source = "auto",
              default_target = "zh-CN",
            },
          },
        },
      })

      local opts = { noremap = true, silent = true, expr = true }

      opts["desc"] = "Translate"
      vim.keymap.set("n", "<leader>T", pantran.motion_translate, opts)
      vim.keymap.set("x", "<leader>T", pantran.motion_translate, opts)

      opts["desc"] = "Translate Line"
      vim.keymap.set("n", "<leader>TT", function()
        return pantran.motion_translate() .. "_"
      end, opts)
    end,
  },
}
