" Plugins

let plug_path = stdpath('data') . '/site/autoload/plug.vim'

if filereadable(glob(plug_path))
  call plug#begin()
  Plug 'easymotion/vim-easymotion'
  Plug 'tpope/vim-surround'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  call plug#end()

  let g:airline_powerline_fonts = 1
  let g:airline_theme = 'minimalist'
endif



" General Configurations

autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
autocmd Syntax * call matchadd('Debug', '\W\zs\(DEBUG\)')
autocmd Syntax * call matchadd('Error', '\W\zs\(ERROR\|FATAL\)')

highlight Comment cterm=italic gui=italic

set hlsearch
set ignorecase
set incsearch
set list listchars=tab:»\ ,trail:·
set noshowcmd
set noshowmode
set nowrapscan
set pastetoggle=<F2>
set relativenumber
set splitbelow
set splitright
set tags=tags;



" Key Mappings

let mapleader = ","

inoremap " ""<Left>
inoremap ' ''<Left>
inoremap ( ()<Left>
inoremap [ []<Left>
inoremap { {}<Left>
inoremap {<CR> {<CR>}<Esc>O

inoremap jk <Esc>

nnoremap <C-H> <C-W>h
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap <Leader><Space> :nohlsearch<CR>
