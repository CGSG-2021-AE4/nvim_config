local opt = vim.opt

opt.splitright = true
opt.splitbelow = true
opt.clipboard = 'unnamedplus'
opt.fixeol = false
opt.completeopt = 'menuone,noselect'
opt.termguicolors = true

-- Lines
opt.number = true
--opt.relativenumber = true
opt.numberwidth = 4
opt.wrap = false

-- Empty chars
opt.list = true
opt.listchars = 'space:·,trail: ,tab:->'
