-- setting vim options
vim.o.termguicolors = true                           -- use true colors, but disable vim colors on urxvt
vim.o.compatible = false                            -- disable compatibility to old-time vim
vim.o.ignorecase = true                              -- do case insensitive matching
vim.o.smartcase = true
vim.o.autoindent = true                              -- indent a new line the same amount as the line just typed
vim.o.showmatch = true                               -- show matching brackets.
vim.o.expandtab = true                               -- converts tabs to white space
vim.o.hlsearch = false                                -- highlight search results
vim.o.relativenumber = true
vim.o.nu = true                                  -- add line numbers
-- vim.o.wildignore+=*/tmp/*,*.so,*.swp,*.zip    -- ctrlp ignore dirs and files
-- vim.o.wildmode = 'longest,list'                   -- get bash-like tab completions
vim.o.background = 'dark'                         -- set colorscheme to dark variant
vim.o.updatetime = 250
vim.o.softtabstop = 2                           -- see multiple spaces as tabstops so <BS> does the right thing
vim.o.encoding = 'utf8'                           -- set file encoding to utf8
vim.o.laststatus = 2
vim.o.shiftwidth = 2                            -- width for autoindents
vim.o.tabstop = 2                               -- number of columns occupied by a tab character
vim.o.cc = '100'                                  -- set an 120 column border for good coding style
vim.o.cursorline = true                              -- set highlight in current line
vim.o.signcolumn = 'yes'
vim.o.completeopt = 'menu,menuone,noselect'
vim.o.scrolloff = 8
vim.o.cmdheight = 2
vim.o.showcmd = true

vim.diagnostic.config({
  --float = true,
  --signs = true,
  --underline = true,
  --update_in_insert = true,
  --severity_sort = false,
})

-- setting plugin options
vim.g.javascript_plugin_jsdoc = 1
