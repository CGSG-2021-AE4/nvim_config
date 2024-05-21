local cmp = require('cmp')
local luasnip = require('luasnip')

require('luasnip.loaders.from_vscode').lazy_load()

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    --[[
    ['<C-Space>'] = cmp.mapping.complete(),  -- Enable tips
    ['<CR>'] = cmp.config.disable,                                    -- Disable
    ['<tab>'] = cmp.mapping.confirm({ seleft = true }),               -- Confirm
    ['<C-e>'] = cmp.mapping.abort(),
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    --]]
    -- Got from mappings example
    ['<CR>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        if luasnip.expandable() then
          luasnip.expand()
        else
          cmp.confirm({
            select = true,
          })
        end
      else
        fallback()
      end
    end),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.locally_jumpable(1) then
        luasnip.jump(1)
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.locally_jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  }),
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

