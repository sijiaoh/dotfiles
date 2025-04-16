return {
  {
    "gbprod/yanky.nvim",
    opts = {
      picker = {
        select = {
          -- LazyVimとyanky.nvimの組み合わせだとYankyRingHistoryがカーソル左にペーストされてしまう
          -- https://github.com/gbprod/yanky.nvim/issues/219
          action = function(...)
            vim.cmd("normal! l")
            require("yanky.picker").actions.put("p")(...)
          end,
        },
      },
    },
  },
}
