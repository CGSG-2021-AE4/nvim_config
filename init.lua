vim.cmd("language en_US")
require('base/search')
require('base/tabs')
require('base/other')
require('keys/main')
require('keys/plugins')
require('plugins/packer')
-- Some shit for cmake
require('plugins/cmake')

vim.cmd [[colorscheme kanagawa]]
