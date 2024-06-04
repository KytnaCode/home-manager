require("edgy").setup({
  left = {
    {
      title = "NvimTree",
      ft = "NvimTree",
      size = {
        height = 0.35,
      },
      open = function()
        require("nvim-tree.api").tree.toggle()
      end,
      pinned = true,
    },
  },
  bottom = {
    {
      ft = "toggleterm",
      size = { height = 0.3 },
      -- exclude floating windows
      filter = function(_, win)
        return vim.api.nvim_win_get_config(win).relative == ""
      end,
    },
    "Trouble",
  },
  right = {
    {
      title = "Test Summary",
      ft = "neotest-summary",
      size = {
        height = 0.8,
        width = 0.28,
      },
      open = function()
        require("neotest").summary.open()
      end,
    },
    {
      title = "Git",
      ft = "git",
      size = {
        width = 0.45,
      },
    },
    {
      title = "Commit",
      ft = "gitcommit",
      size = {
        width = 0.45,
      },
      open = function()
        vim.cmd("G commit -v")
      end,
    },
  },
})
