local cmp = require('cmp')
local luasnip = require('luasnip')

require('luasnip.loaders.from_vscode').lazy_load()

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp.expand(args.body)
    end,
  },
  mapping = {
    ['C-Space'] = cmp.mapping.complete(),  -- Enable tips
    -- ['<CR>'] = cmp.config.disable,                                    -- Disable
    ['<Tab>'] = cmp.mapping.confirm({ seleft = true }),               -- Confirm
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  --[[ It containts mistakes - does not work
  formatting = {
    fields = { 'menu', 'addr', 'kind' },
  },
  --]]
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    -- { name = 'nvim_lsp_signature_help' },
    { name = 'luasnip', keyword_length = 1 },
    { name = 'buffer', keyword_length = 2 },
    { name = 'path', keyword_length = 3 },
    -- { name = 'emoji' },
  }, {
    { name = 'buffer' },
  }),
}

