vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function( use )
  use 'wbthomason/packer.nvim' -- Packer
  use 'nvim-tree/nvim-web-devicons' -- Icons for files
  use 'yorickpeterse/nvim-window'

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
    'nvim-lualine/lualine.nvim',
    requires = {
      'nvim-tree/nvim-web-devicons',
      --opt = true,
    },
    config = function()
      require('lualine').setup({
        options = {
          theme = 'codedark',
          section_separators = { left = '', right = '' },
          component_separators = { left = '', right = '' },
          disabled_filetypes = {
            statusline = {
              'packer',
              'NVimTree',
            },
          },
        },
        extensions = {
          'nvim-tree',
        },
      })
    end,
  }
  use {
    'rust-lang/rust.vim',
    requires = {
      'rust-lang/rustfmt.vim',
    },
    config = function()
      vim.g.rustfmt_autosave = 1
    end,
  }
  -- Key cheetsheet
  --[[
  use {
    'folke/which-key.nvim',
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require('whiklch-key').setup({

      })
  }
  --]]
  use {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    event = { 'VimEnter' },
    config = function(_, opts)
      require('nvim-treesitter').setup(opts)
    end,
    opts = {
      ensure_installed = { 'lua', 'vim', 'vimdoc', 'rust', 'toml' },
      auto_install = true,
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

  -- Color themes
  use {
    'rebelot/kanagawa.nvim',
    colors = {
      theme = {
        all = {
          ui = {
            bg_gutter = "none"
          }
        }
      }
    },
  }
  -- use 'folke/tokyonight.nvim' 
  --[[
  use {
    'catppuccin/nvim',
    as = 'catppuccin',
  }
  --]]

  -- LSP server and dependencies
  use 'williamboman/mason.nvim'
  use {
    'williamboman/mason-lspconfig.nvim',
    requires = {
      'williamboman/mason.nvim',
    },
    config = function()
      require('mason').setup()
      require('mason-lspconfig').setup({
        ensure_installed = {
            'lua_ls',
            'cmake',
            'clangd',
            'pyright',
            'rust_analyzer',
          }
        })
    end,
  }
  use {
    'neovim/nvim-lspconfig',
    requires = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
    },
    config = function()
      require('plugins/lspconfig')
    end,
  }
  --[[
  use {
    'williamboman/nvim-lsp-installer',
    config = function()
      -- require('plugins/lsp-installer').setup()
    end,
  }
  use {
    'folke/trouble.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      -- require('trouble').setup()
    end,
  }
  --]]
  -- Copmlete
  use 'L3MON4D3/LuaSnip'
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'neovim/nvim-lspconfig',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-cmdline',
--      'hrsh7th/cmp-nvim-lsp-signature-help',
      'hrsh7th/cmp-nvim-lua',
    },
    -- dependencies = { 'L3MON4D3/luasnip' },
    config = function()
      require('plugins/cmp')
    end,
  }
  use 'famiu/bufdelete.nvim'
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
    },
    config = function()
      require('telescope').setup({
        file_ignore_patterns = {
          '.git/'
        },
      })
    end,
  }
  use {
    'Shatur/neovim-cmake',
    config = function()
      require('plugins/cmake')
    end,
  }
  --[[ Fucking shit that does not work(still is not ready)
  use {
    'Civitasv/cmake-tools.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'stevearc/overseer.nvim',
    },
  }
  --]]
end)

