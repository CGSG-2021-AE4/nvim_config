local lspconfig = require('lspconfig')
local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

-- LSP lua server config
lspconfig.lua_ls.setup({
  capabilities = lsp_capabilities,
  filetypes = { 'lua' },
  settings = {
    Lua = {
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
    },
  },
})

-- C/Cpp LSP server config
lspconfig.clangd.setup({
  capabilities = lsp_capabilities,
  filetypes = { 'c', 'cpp', 'h', 'hpp' },
  --[[
  init_options = {
    compilationDatabasePath = './out/Debug',
  },
  --]]
  -- For Cmake
  on_new_config = function(new_config, new_cmd)
    local status, cmake = require('cmake-tools')
    if status then
      cmake.clang_on_new_config(new_config)
    end
  end,
})

-- Rust LSP server config
lspconfig.rust_analyzer.setup({
  capabilities = lsp_capabilities,
  filetypes = { 'rust' },
  root_dir = require('lspconfig/util').root_pattern('Cargo.toml'),
  settings = {
    ['rust_analyzer'] = {
      cargo = {
        allFeatures = true,
      },
    },
  },
})

-- Cmake LSP server config
lspconfig.cmake.setup({
  capabilities = lsp_capabilities,
})

vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function()
    local bufmap = function(mode, lhs, rhs)
      local opts = { buffer = true }
      vim.keymap.set(mode, lhs, rhs, opts)
    end

    bufmap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')
    bufmap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')
    bufmap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')
    bufmap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')
    bufmap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>')
    bufmap('n', 'go', '<cmd>lua vim.lsp.buf.type_declaration()<cr>')
    bufmap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>')
    bufmap('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>')
    bufmap('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>')
    -- ...
  end,
})
