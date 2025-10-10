-- markdownのリンターをグローバルカスタマイズ可能にする
-- From: https://github.com/LazyVim/LazyVim/discussions/4094#discussioncomment-14186984
return {
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters = {
        ["markdownlint-cli2"] = {
          args = { "--config", vim.fn.expand("$HOME/.markdownlint-cli2.yaml"), "--" },
        },
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters = {
        ["markdownlint-cli2"] = {
          args = { "--config", vim.fn.expand("$HOME/.markdownlint-cli2.yaml"), "--fix", "$FILENAME" },
        },
      },
    },
  },
}
