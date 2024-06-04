local o = vim.o
local opt = vim.opt

-- Spell

opt.spell = true
opt.spelllang = { "en_us", "es_mx" }

-- Indentation
o.expandtab = true -- expand tab input with spaces characters
o.smartindent = true -- syntax aware indentations for newline inserts
o.tabstop = 2 -- num of space characters per tab
o.shiftwidth = 2 -- spaces per indentation level

-- Core
o.clipboard = "unnamedplus"
o.laststatus = 3
o.splitkeep = "screen"
o.signcolumn = "yes:1"
o.number = true
