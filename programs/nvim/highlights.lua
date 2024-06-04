local colors = require("catppuccin.palettes").get_palette("latte")

vim.api.nvim_set_hl(0, "NeotestPassed", { fg = colors.green })

vim.api.nvim_set_hl(0, "Beacon", { bg = colors.blue })
