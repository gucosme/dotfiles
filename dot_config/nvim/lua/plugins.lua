local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  Packer_bootstrap = fn.system({
    'git', 'clone', 'https://github.com/wbthomason/packer.nvim',
    install_path
  })
  execute 'packadd packer.nvim'
end

vim.cmd([[
  augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {'nvim-lua/plenary.nvim'}
  -- loads nvim faster
  use 'nathom/filetype.nvim'

  -- colorscheme
  use {
    'rebelot/kanagawa.nvim',
    config = function() vim.cmd 'colorscheme kanagawa' end
  }

  -- File navigation
  use {
    'nvim-telescope/telescope.nvim',
    cmd = "Telescope",
    module = 'telescope',
    after = 'plenary.nvim',
    requires = {
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        opt = true,
        event = "UIEnter",
        run = 'make'
      }, {
        'benfowler/telescope-luasnip.nvim',
        opt = true,
        module = 'telescope._extensions.luasnip'
      }
    },
    config = function() 
      local telescope = require('telescope')

      telescope.setup()

      telescope.load_extension('fzf')
      telescope.load_extension('luasnip')
    end
  }
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons',
      opt = true
    },
    event = "UIEnter",
    config = function()
      require'nvim-tree'.setup {
        update_cwd = true
      }
    end
  }

  -- ultilities
  use 'tpope/vim-commentary'
  use 'tpope/vim-surround'
  use {
    'nvim-treesitter/nvim-treesitter',
    event = 'UIEnter',
    run = ':TSUpdate',
    config = function()
      require 'nvim-treesitter.configs'.setup {
        ensure_installed = {
          "bash", "comment", "css", "dockerfile", "dot", "go", "graphql",
          "help", "html", "java", "javascript", "jsdoc", "json", "json5",
          "jsonc", "kotlin", "lua", "markdown", "python", "regex", "rst",
          "rust", "scss", "todotxt", "toml", "tsx", "typescript", "vim",
          "vue", "yaml"
        },
        highlight = {
          enable = true
        },
        indent = {
          enable = true
        }
      }
    end
  }
  use {
    'nvim-treesitter/nvim-treesitter-context',
    after = 'nvim-treesitter'
  }
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup {
        numhl = true,
        current_line_blame = true,
        current_line_blame_opts = {
          delay = 600,
        },
        current_line_blame_formatter_opts = {
          relative_time = true
        },
      }
    end
  }
  use {
    'lukas-reineke/indent-blankline.nvim' ,
    config = function() 
      require('indent_blankline').setup {
        char = "",
        context_char = "|",
        show_current_context = true,
      }
    end
  }
  use {
    'mattn/emmet-vim',
    ft = {
      'html', 'css', 'javascript', 'javascriptreact', 'vue', 'typescript',
      'typescriptreact'
    }
  }

  -- lsp configuration and setup
  use {
    'williamboman/mason.nvim',
    config = function()
      require("mason").setup()
    end
  }
  use {
    "williamboman/mason-lspconfig.nvim",
    after = 'mason.nvim',
    config = function()
      require("mason-lspconfig").setup{
        ensure_installed = {
          'sumneko_lua',
          'tsserver',
        }
      }
    end
  }
  use {
    "neovim/nvim-lspconfig",
    after = 'mason-lspconfig.nvim'
  }

  --completion
  use {
    'hrsh7th/nvim-cmp',
    event = "UIEnter",
    opt = true,
    requires = {
      {
        'hrsh7th/cmp-nvim-lsp',
        module = "cmp_nvim_lsp",
        opt = true
      }, {
        'hrsh7th/cmp-buffer',
        opt = true
      }, {
        'hrsh7th/cmp-path',
        opt = true
      }, {
        'hrsh7th/cmp-nvim-lua',
        opt = true
      }, {
        'saadparwaiz1/cmp_luasnip',
        opt = true
      }
    },
    config = function() require'completion'.setup() end
  }
  use {
    'L3MON4D3/LuaSnip',
    after = "nvim-cmp",
    requires = {{"rafamadriz/friendly-snippets"}},
    config = function() require'completion'.luasnip() end
  }

  -- languages
  -- javascript
  use 'pangloss/vim-javascript'
  use 'othree/yajs.vim'
  use 'maxmellon/vim-jsx-pretty'

  -- typescript
  use 'HerringtonDarkholme/yats.vim'

  -- terraform
  use 'hashivim/vim-terraform'

  if Packer_bootstrap then require('packer').sync() end
end)

--[==[
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-file-browser.nvim'
end)

local telescope = require("telescope")
telescope.load_extension "file_browser"
telescope.setup{ defaults = { file_ignore_patterns = { "node_modules", "^.git/" } } }
--]==]

