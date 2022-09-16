vim.cmd [[packadd packer.nvim]]

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-file-browser.nvim'
  use 'lewis6991/gitsigns.nvim'
  use 'lukas-reineke/indent-blankline.nvim'

  use {'nvim-treesitter/nvim-treesitter' }
  use 'nvim-treesitter/nvim-treesitter-context'

  -- lsp config, autocomplete, and more
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'

  use 'saadparwaiz1/cmp_luasnip'
  use "rafamadriz/friendly-snippets"
  use 'L3MON4D3/LuaSnip' -- Snippets plugin

  use 'rebelot/kanagawa.nvim'

  -- javascript
  use 'pangloss/vim-javascript'
  use 'othree/yajs.vim'
  use 'maxmellon/vim-jsx-pretty'

  -- typescript
  use 'HerringtonDarkholme/yats.vim'

  -- terraform
  use 'hashivim/vim-terraform'
end)

local telescope = require("telescope")
telescope.load_extension "file_browser"
telescope.setup{ defaults = { file_ignore_patterns = { "node_modules", "^.git/" } } }

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

require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true
  },
  indent = {
    enable = true
  }
}

require('indent_blankline').setup {
  char = "",
  context_char = "|",
  show_current_context = true,
}

require("luasnip.loaders.from_vscode").lazy_load()

local luasnip = require 'luasnip'
local cmp = require('cmp')

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end,
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  }, {
    { name = 'buffer' },
    { name = 'path' },
  })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local lspconfig = require('lspconfig')

lspconfig.tsserver.setup{
  capabilities = capabilities
}
lspconfig.eslint.setup{}
lspconfig.csharp_ls.setup{}
lspconfig.prismals.setup{}
