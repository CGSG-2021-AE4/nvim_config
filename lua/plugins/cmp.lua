local cmp = require('cmp')
local lspkind = require('lspkind')

cmp.setup {
  snippet = {
    expand = function(args)
      require('luasnip').lsp.expand(args.body)
    end,
  },
  mapping = {
    ['C-Space'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c', }), -- Enable tips
    ['<CR>'] = cmp.config.disable,                                    -- Disable
    ['<Tab>'] = cmp.mapping.confirm({ seleft = true }),               -- Confirm

    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ['<C-p>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
    ['<C-n>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
  },
  sources = cmp.config.source({
    { name = 'nvim_lsp' },
    { name = 'nvim_lsp_signature_help' },
    { name = 'luasnip' },
    { name = 'buffer' },
    { name = 'path' },
    { name = 'emoji' },
  }, {
  }),
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol',
      maxwidth = 50,
    })
  }
}

