vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function()
  use 'wbthomason/packer.nvim' -- Packer
  -- use 'neovim/nvim-lspconfig' -- LSP server
  use 'nvim-tree/nvim-web-devicons' -- Icons for files
  use { -- Files tree
    'nvim-tree/nvim-tree.lua',
    config = function()
      require('nvim-tree').setup()
    end,
  }
  use {
    'akinsho/bufferline.nvim',
    version = '*',
    dependecies = { 'nvim-tree/nvim-web-devicons' },
    event = { 'VimEnter' },
    config = function()
      require('plugins/bufferline')
    end,
  }
  use {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    event = { 'VimEnter' },
    config = function(_, opts)
      require('nvim-treesitter').setup(opts)
    end,
    opts = {
      ensure_installed = {'lua', 'vim', 'vimdoc', },
      highlight = true,
    },
  }
  use {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = function()
      require('nvim-autopairs').setup()
    end,
  }
  --[[
  use {
    'onsails/lspkind-nvim',
    config = function()
      require('plugins/lspkind')
    end,
  }
  use {
    'williamboman/nvim-lsp-installer',
    --[[
    config = function()
      require('plugins/lsp-installer')
    end,
  }
  use {
    'folke/trouble.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('trouble').setup {}
    end,
  }
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-emoji',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      'hrsh7th/cmp-nvim-lua',
    },
    config = function()
      require('plugins/cmp')
    end,
  }
  --]]
  use {
    'rebelot/kanagawa.nvim',
  }
  use 'folke/tokyonight.nvim' 
  use {
    'catppuccin/nvim',
    as = 'catppuccin',
  }
end)

