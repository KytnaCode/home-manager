require("lint").linters_by_ft = {
  lua = { "selene" },
  go = { "golangcilint" },
  vim = { "vint" },
  bash = { "shellcheck", "shellharden" },
  javascript = { "eslint_d" },
  typescript = { "eslint_d" },
}

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  callback = function()
    require("lint").try_lint()
  end,
})
