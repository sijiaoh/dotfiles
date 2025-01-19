-- From: http://www.lazyvim.org/plugins/util#snacksnvim
return {
  "snacks.nvim",
  opts = {
    bigfile = { enabled = true },
    quickfile = { enabled = true },
    terminal = {
      win = {
        keys = {
          nav_h = { "<C-h>", false },
          nav_j = { "<C-j>", false },
          nav_k = { "<C-k>", false },
          nav_l = { "<C-l>", false },
        },
      },
    },
  },
  -- stylua: ignore
  keys = {
    { "<leader>.",  function() Snacks.scratch() end, desc = "Toggle Scratch Buffer" },
    { "<leader>S",  function() Snacks.scratch.select() end, desc = "Select Scratch Buffer" },
    { "<leader>dps", function() Snacks.profiler.scratch() end, desc = "Profiler Scratch Buffer" },
  },
}
