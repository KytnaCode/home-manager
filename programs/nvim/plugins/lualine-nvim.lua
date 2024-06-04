require("lualine").setup({
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "filename", "branch" },
  },
  options = {
    theme = "catppuccin-latte", -- set lualine theme, commonly the same set in catppucin theme config
  },
  extensions = { "nvim-dap-ui", "trouble" },
})
