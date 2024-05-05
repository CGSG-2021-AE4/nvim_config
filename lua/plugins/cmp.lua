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
    ['C-Space'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),  -- Enable tips
    ['<CR>'] = cmp.config.disable,                                    -- Disable
    ['<Tab>'] = cmp.mapping.confirm({ seleft = true }),               -- Confirm

    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ['<C-p>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
    ['<C-n>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
  },
  window = {
    documentation = cmp.config.window.bordered()
  },
  formatting = {
    fields = { 'menu', 'addr', 'kind' },
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    -- { name = 'nvim_lsp_signature_help' },
    { name = 'luasnip', keyword_length = 1 },
    { name = 'buffer', keyword_length = 1 },
    { name = 'path', keyword_length = 1 },
    -- { name = 'emoji' },
  }, {
    { name = 'buffer' },
  }),
}

