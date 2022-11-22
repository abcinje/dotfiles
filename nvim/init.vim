" Plugins

call plug#begin()
Plug 'vim-airline/vim-airline'
call plug#end()

let g:airline_powerline_fonts = 1



" General Configurations

autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
autocmd Syntax * call matchadd('Debug', '\W\zs\(DEBUG\)')
autocmd Syntax * call matchadd('Error', '\W\zs\(ERROR\|FATAL\)')

highlight Comment cterm=italic gui=italic

let mapleader = ","

set ignorecase
set list listchars=tab:»\ ,trail:·
set noshowcmd
set nowrapscan
set pastetoggle=<F2>
set relativenumber
set splitbelow
set splitright



" Key Mappings

imap jk <Esc>
nmap <C-H> <C-W>h
nmap <C-J> <C-W>j
nmap <C-K> <C-W>k
nmap <C-L> <C-W>l
nmap <Leader><Space> :nohlsearch<CR>
