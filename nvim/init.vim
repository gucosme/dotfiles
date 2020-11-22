" setting vim options
set termguicolors                           " use true colors, but disable vim colors on urxvt
set nocompatible                            " disable compatibility to old-time vim
set ignorecase                              " do case insensitive matching
set autoindent                              " indent a new line the same amount as the line just typed
set cursorline                              " set highlight in current line
set showmatch                               " show matching brackets.
set expandtab                               " converts tabs to white space
set hlsearch                                " highlight search results
set number                                  " add line numbers
set wildignore+=*/tmp/*,*.so,*.swp,*.zip    " ctrlp ignore dirs and files
set wildmode=longest,list                   " get bash-like tab completions
set background=light                        " set colorscheme to dark variant
set updatetime=250
set softtabstop=4                           " see multiple spaces as tabstops so <BS> does the right thing
set encoding=utf8                           " set file encoding to utf8
set laststatus=2
set shiftwidth=2                            " width for autoindents
set tabstop=2                               " number of columns occupied by a tab character
set mouse=v                                 " middle-click paste with mouse
set cc=120                                  " set an 80 column border for good coding style

filetype off

call plug#begin('~/.vim/plugged')

" theme
" Plug 'morhetz/gruvbox'
" Plug 'joshdick/onedark.vim'
" Plug 'arcticicestudio/nord-vim'
" Plug 'lifepillar/vim-solarized8'
" Plug 'sjl/badwolf'
" Plug 'junegunn/seoul256.vim'
" Plug 'romainl/Apprentice'
" Plug 'NLKNguyen/papercolor-theme'
" Plug 'chriskempson/base16-vim'
Plug 'dracula/vim'

" statusline
" Plug 'vim-airline/vim-airline'

" code completion
" Plugin 'valloric/youcompleteme'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" linting and LSP
Plug 'dense-analysis/ale'

" indentention config
Plug 'editorconfig/editorconfig-vim'

" pair completion
Plug 'jiangmiao/auto-pairs'

" finder for vim
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" tree explorer
Plug 'scrooloose/nerdtree'

" html markup expasion
Plug 'mattn/emmet-vim'

" git diff inline
Plug 'airblade/vim-gitgutter' 

" git wrapper
Plug 'tpope/vim-fugitive'

" icons per file type
Plug 'ryanoasis/vim-devicons'

" indent guides
Plug 'nathanaelkane/vim-indent-guides'

"
" LANGUAGE/SERVICE SPECIFIC PLUGINS
"

" javascript
Plug 'pangloss/vim-javascript'
Plug 'othree/yajs.vim'
Plug 'mxw/vim-jsx'

" typescript
" Plug 'leafgarland/typescript-vim'
Plug 'HerringtonDarkholme/yats.vim'

" golang
Plug 'fatih/vim-go'

" elixir
Plug 'elixir-lang/vim-elixir'
" Plugin 'mhinz/vim-mix-format'

" cpp
Plug 'octol/vim-cpp-enhanced-highlight'

" vue
Plug 'posva/vim-vue'

" rust
Plug 'rust-lang/rust.vim'

" svelte
Plug 'burner/vim-svelte'

" C#
" Plugin 'OmniSharp/omnisharp-vim'


" All Plugins must be added before the following line
call plug#end()
filetype plugin indent on  " allows auto-indenting depending on file type

" colorscheme gruvbox
" colorscheme base16-tomorrow-night-eighties
colorscheme dracula

" onedark options
let g:onedark_terminal_italics = 1

" gruvbox options
let g:gruvbox_italic = '1'

" airline options
" if !exists('g:airline_symbols')
"    let g:airline_symbols = {}
"endif
"
"let g:airline_left_sep = ''
"let g:airline_left_alt_sep = ''
"let g:airline_right_sep = ''
"let g:airline_right_alt_sep = ''
"let g:airline_symbols.branch = ''
"let g:airline_symbols.readonly = ''
"let g:airline_symbols.linenr = ''
"let g:airline_symbols.paste = 'ρ'
"let g:airline_symbols.paste = 'Þ'
"let g:airline_symbols.paste = '∥'
"let g:airline_symbols.whitespace = 'Ξ'
" let g:airline_mode_map = {
" \ '__' : '-',
" \ 'n'  : 'N',
" \ 'i'  : 'I',
" \ 'R'  : 'R',
" \ 'c'  : 'C',
" \ 'v'  : 'V',
" \ 'V'  : 'V',
" \ '^V' : 'V',
" \ 's'  : 'S',
" \ 'S'  : 'S',
" \ '^S' : 'S',
" \ }

" ycm options
let g:ycm_python_binary_path = 'python'
let g:ycm_global_ycm_extra_conf = "~/.ycm_extra_conf.py"

" coc options
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
" use <c-space>for trigger completion
inoremap <silent><expr> <c-space> coc#refresh()

" ale options
let g:ale_sign_error = ' •'
let g:ale_sign_warning = ' ‣'
let g:ale_fix_on_save = 1
let g:ale_sign_column_always = 1
let g:ale_completion_enabled = 0
let g:airline#extensions#ale#enabled = 1
let g:ale_elixir_elixir_ls_release = '/home/gustavo/projetos/elixir/elixir-ls/rel'
let g:ale_rust_cargo_use_clippy = executable('cargo-clippy')

" ctrlp
let g:ctrlp_custom_ignore = '\v[\/](node_modules)|(\.git)|(_build)|(deps)|(vendor)$'
let g:ctrlp_show_hidden = 1

" fzf
" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

let g:fzf_layout = { 'down': '~15%' }

" nerdtree
let NERDTreeShowHidden=1

" vim-indent-guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 2

" vim-go
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_auto_sameids = 1
let g:go_fmt_command = "goimports"
" disable :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0

" vim-javascript
let g:javascript_plugin_jsdoc = 1

" rust.vim
let g:rustfmt_autosave = 1

" svelte
let g:ale_linter_aliases = {'svelte': ['css', 'javascript']}
let g:ale_linters = {'svelte': ['eslint']}

" vim-polyglot
" let g:polyglot_disabled = ['css', 'javascript']

"
" MAPPINGS
"

map <C-p> :Files<CR>
map <C-f> :Rg<CR>
map <C-h> :NERDTreeToggle<CR>
