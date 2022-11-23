" Plugins

let path = stdpath('data') . '/site/autoload/plug.vim'

if empty(glob(path))
  if executable('curl')
    silent execute '!curl -fLo ' . path . ' --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  endif
endif

if filereadable(glob(path))
  call plug#begin()
    Plug 'easymotion/vim-easymotion'
    Plug 'preservim/nerdtree'
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
set nowrapscan
set pastetoggle=<F2>
set relativenumber
set splitbelow
set splitright



" Key Mappings

let mapleader = ","

imap jk <Esc>

nmap <C-H> <C-W>h
nmap <C-J> <C-W>j
nmap <C-K> <C-W>k
nmap <C-L> <C-W>l
nmap <Leader><Space> :nohlsearch<CR>
