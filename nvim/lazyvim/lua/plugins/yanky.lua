return {
  {
    "gbprod/yanky.nvim",
    opts = {
      picker = {
        select = {
          action = function(...)
            vim.cmd("normal! l")
            require("yanky.picker").actions.put("p")(...)
          end,
        },
      },
    },
  },
}
