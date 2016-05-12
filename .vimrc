set nocompatible " Required
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage itself
Plugin 'VundleVim/Vundle.vim'

" Plugins
Plugin 'Valloric/YouCompleteMe'
Plugin 'severin-lemaignan/vim-minimap'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'nanotech/jellybeans.vim'
Plugin 'vim-scripts/taglist.vim'

" Required, Plugins available after
call vundle#end()
filetype plugin indent on
" See :h vundle for more details or wiki for FAQ

syntax on
set ruler
set number
set incsearch

set colorcolumn=80
highlight ColorColumn ctermbg=darkgray

set tabstop=4
set shiftwidth=4
set shiftround

set ignorecase
set smartcase

set smarttab
set hlsearch
set textwidth=0
set backspace=indent,eol,start

set history=1000
set undolevels=1000
set title

set nobackup
set noswapfile
set noerrorbells
set novisualbell

set autochdir
set autoindent
set smartcase

set guioptions=agitc
set guifont=Monaco:h10 noanti
set t_Co=256
if has('gui_running')
	colorscheme jellybeans
	let g:jellybeans_use_lowcolor_black = 1
	let g:jellybeans_use_term_italics = 1
else
	colorscheme delek
endif

" Spell check"
au BufNewFile,BufRead *.markdown,*.md,*.dox,COMMIT_EDITMSG,README,CHANGELOG,INSTALL setlocal spell
" :setlocal spell spelllang=en_us
" :set spell

" ctags taglist
let Tlist_WinWidth = 50
map <F4> :TlistToggle<cr>

" Space to go into command mode
nnoremap <space> :
" ö for visiting marks
nnoremap ö `

" Work up the directory tree to find 'tags'
set tags =./tags;/

set scrolloff=4
set wildmode=list:longest
set laststatus=2
set relativenumber
set statusline=%02n:\ %<%f\ [%{GetFileInfo()}]\ \ %m%r%h%=%-14.(%l:%c%V%)\ %P
au BufNewFile,BufRead *.install set filetype=php
au BufNewFile,BufRead *.rs set filetype=rust
au BufWritePost *.c,*.cpp,*.h,*.py,*.rs silent! !ctags -R * &

" Remap <esc> to jj
inoremap jj <esc>

function! GetFileInfo()
	let fi = &fileformat
	if &fileencoding != ''
		let fi = fi . ':' . &fileencoding
	endif
	if &filetype != ''
		let fi = fi . ':' . &filetype
	endif
	return fi
endfunction

" Highlight trailing white spaces
:highlight ExtraWhitespace ctermbg=red guibg=red
autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/ containedin=ALL

function! s:Fws(line1,line2)
	let l:save_cursor = getpos(".")
	silent! execute ':' . a:line1 . ',' . a:line2 . 's/\s\+$//'
	call setpos('.', l:save_cursor)
endfunction

" Run :Fws to remove trailing white spaces
command! -range=% Fws call <SID>Fws(<line1>,<line2>)

cmap w!! w !sudo tee % >/dev/null<CR>

"let c_C99 = 1

" This prevents YCM from overriding the options below
let g:ycm_register_as_syntastic_checker = 0
" Syntastic checker config
let g:syntastic_c_checkers=['gcc', 'splint', 'make']
let g:syntastic_c_compiler='gcc'
let g:syntastic_c_compiler_options='-Wall -Werr -Wextra'
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'

" UltiSnips config
let g:UltiSnipsExpandTrigger="§"

" Highlight unexpected characters
" This makes mixed tabs and spaces obvious (important for python), and
" OS X in particular is awesome at adding non-breaking spaces unexpectedly
set list
set listchars=tab:↦\ ,extends:↷,precedes:↶,nbsp:¬
