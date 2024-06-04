require("formatter").setup({
  filetype = {
    lua = {
      require("formatter.filetypes.lua").stylua,
    },
    go = {
      require("formatter.filetypes.go").gofmt(),
      require("formatter.filetypes.go").golines(),
      require("formatter.filetypes.go").goimports(),
    },
    bash = {
      function()
        local shiftwidth = vim.o.shiftwidth

        return {
          exe = "beautysh",
          args = { "-i", shiftwidth },
          stdin = true,
        }
      end,
    },
    javascript = {
      require("formatter.filetypes.javascript").prettierd,
      require("formatter.filetypes.javascript").eslint_d,
    },
    javascriptreact = {
      require("formatter.filetypes.javascriptreact").prettierd,
      require("formatter.filetypes.javascriptreact").eslint_d,
    },
    typescript = {
      require("formatter.filetypes.typescript").prettierd,
      require("formatter.filetypes.typescript").eslint_d,
    },
    typescriptreact = {
      require("formatter.filetypes.typescriptreact").prettierd,
      require("formatter.filetypes.typescriptreact").eslint_d,
    },
  },
})

vim.api.nvim_create_augroup("__formatter__", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
  group = "__formatter__",
  command = ":FormatWrite",
})