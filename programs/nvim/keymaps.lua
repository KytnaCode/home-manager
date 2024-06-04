local map = vim.keymap.set

-- Core

-- now delete doesn't put text in t he clipboard, this is true in all maps that use d, d$, dd, dl, etc
map({ "n", "v" }, "d", '"_d')
map("n", "fc", "<CMD>foldclose<CR>")
map("n", "fo", "<CMD>foldopen<CR>")

-- Git

map("n", "<leader>gc", "<CMD>G commit -v<CR>")
map("n", "<leader>gl", "<CMD>G log<CR>")

-- Testing

local neotest = require("neotest")
map("n", "<leader>ur", function()
  neotest.run.run()
  neotest.summary.open()
  neotest.output.open({ enter = true })
end)
map("n", "<leader>uf", function()
  neotest.run.run(vim.fn.expand("%"))
end)
map("n", "<leader>us", function()
  neotest.run.stop()
end)
map("n", "<leader>ut", function()
  neotest.run.attach()
end)

-- Files

local tree_api = require("nvim-tree.api")
map("n", "<leader>tt", tree_api.tree.toggle, {})

-- Buffers

map("n", "bn", "<CMD>bnext<CR>")
map("n", "bp", "<CMD>bprevious<CR>")
map("n", "bd", "<CMD>Bdelete<CR>") -- use Bdelete provided by bufdelete.nvim instead of built-in bdelete to avoid losing window layout

-- Telescope

local builtin = require("telescope.builtin")
map("n", "<leader>ff", builtin.find_files, {})
map("n", "<leader>fg", builtin.live_grep, {})
map("n", "<leader>fu", builtin.buffers, {})
map("n", "<leader>fc", builtin.git_commits, {})
map("n", "<leader>fb", builtin.current_buffer_fuzzy_find, {})

-- IDE

map("n", "gD", "<CMD>Glance definitions<CR>")
map("n", "gR", "<CMD>Glance references<CR>")
map("n", "gY", "<CMD>Glance type_definitions<CR>")
map("n", "gM", "<CMD>Glance implementations<CR>")

local dap = require("dap")
local dapui = require("dapui")

map("n", "<leader>bb", function()
  if vim.g.debug_mode then
    dap.disconnect()
    dapui.close()
    vim.g.debug_mode = false
    return
  end

  dap.continue()
end)
map("n", "to", function()
  if vim.g.debug_mode == false then
    return
  end
  dap.step_over()
end)

dap.listeners.before.attach.dapui_config = function()
  vim.g.debug_mode = true
  dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
  vim.g.debug_mode = true
  dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  vim.g.debug_mode = false
  dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  vim.g.debug_mode = false
  dapui.close()
end

map("n", "<C-Space>", vim.lsp.buf.code_action)
map("n", "<leader>rn", "<CMD>IncRename<CR>")

local ls = require("luasnip")

map({ "i" }, "<C-K>", function()
  ls.expand()
end, { silent = true })
map({ "i", "s" }, "<C-L>", function()
  ls.jump(1)
end, { silent = true })
map({ "i", "s" }, "<C-J>", function()
  ls.jump(-1)
end, { silent = true })

map({ "i", "s" }, "<C-E>", function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end, { silent = true })
