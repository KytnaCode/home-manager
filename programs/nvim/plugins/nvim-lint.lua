require("lint").linters_by_ft = {
  lua = { "selene" },
  go = { "golangcilint" },
  vim = { "vint" },
  bash = { "shellcheck", "shellharden" },
  javascript = { "eslint" },
  typescript = { "eslint" },
  svelte = { "eslint" },
  css = { "eslint" },
  html = { "eslint" },
}

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  callback = function()
    require("lint").try_lint()
  end,
})
