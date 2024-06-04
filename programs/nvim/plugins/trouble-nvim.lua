require("trouble").setup({})

local map = vim.keymap.set

map("n", "<leader>xx", "<CMD>TroubleToggle workspace_diagnostics<CR>")
map("n", "<leader>xX", "<CMD>TroubleToggle document_diagnostics<CR>")
map("n", "<leader>ct", "<CMD>TroubleToggle telescope<CR>")
map("n", "<leader>cd", "<CMD>TroubleToggle lsp_definitions<CR>")
map("n", "<leader>xL", "<CMD>TroubleToggle loclist<CR>")
map("n", "<leader>xQ", "<CMD>TroubleToggle quickfix<CR>")
