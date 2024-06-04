require("catppuccin").setup({
  integrations = {
    alpha = true,
    beacon = true,
    fidget = true,
    gitsigns = true,
    indent_blankline = {
      enabled = true,
      scope_color = "text", -- catppuccin color (eg. `lavender`) Default: text
      colored_indent_levels = false,
    },
    leap = true,
    cmp = true,
    dap = true,
    dap_ui = true,
    native_lsp = {
      enabled = true,
      virtual_text = {
        errors = { "italic" },
        hints = { "italic" },
        warnings = { "italic" },
        information = { "italic" },
        ok = { "italic" },
      },
      underlines = {
        errors = { "underline" },
        hints = { "underline" },
        warnings = { "underline" },
        information = { "underline" },
        ok = { "underline" },
      },
      inlay_hints = {
        background = true,
      },
    },
    nvimtree = true,
    treesitter = true,
    telescope = {
      enabled = true,
    },
    lsp_trouble = true,
  },
})

vim.cmd.colorscheme("catppuccin-latte")