local opt = vim.opt

-- Some basic repferences
-- vim.g.noshellslash = true

opt.splitright = true
opt.splitbelow = true
opt.clipboard = 'unnamedplus'
opt.fixeol = false
opt.completeopt = { 'menu', 'menuone' , 'noselect' }
opt.termguicolors = true

-- Lines
opt.number = true
--opt.relativenumber = true
opt.numberwidth = 4
opt.wrap = false
vim.o.signcolumn = 'number'

-- Empty chars
opt.list = true
opt.listchars = 'space:·,trail: ,tab:->'
