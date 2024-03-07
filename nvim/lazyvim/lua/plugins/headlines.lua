-- fat_headline_lower_string default value is not included in my using fonts.
-- From: https://github.com/LazyVim/LazyVim/discussions/1816#discussioncomment-7340942
return {
  {
    "lukas-reineke/headlines.nvim",
    opts = {
      markdown = {
        fat_headline_lower_string = "▔",
      },
    },
  },
}
