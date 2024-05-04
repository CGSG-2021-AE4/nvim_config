local lspconfig = require('lspconfig')
local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Load snippets
require('luasnip.loaders.from_vscode').packer_load() -- OR lazy_load ???

-- LSP lua server config
lspconfig.lua_ls.setup({
  capabilities = lsp_capabilities,
})


