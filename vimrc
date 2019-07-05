" Backspace
set backspace=indent,eol,start

" Blanks
set list listchars=tab:»\ ,trail:·

" Color Scheme
silent! colorscheme jellybeans

" Compatibility
set nocompatible

" Highlight
set cursorline

if has("syntax")
	syntax on
endif

if has("autocmd")
	if v:version > 701
		autocmd Syntax * call matchadd('Debug', '\W\zs\(DEBUG\)')
		autocmd Syntax * call matchadd('ErrorMsg', '\W\zs\(ERROR\|FATAL\)')
	endif
endif

" Indentation
set autoindent
set cindent
set shiftwidth=8
set smartindent
set smarttab
set tabstop=8

" Interface
set background=dark
set laststatus=2
set number
set ruler
set showcmd
set title

" Line Break
set linebreak

" Mouse
if has("mouse")
	set mouse=a
endif

" Search
set hlsearch
set ignorecase
set incsearch
set nowrapscan
set smartcase
