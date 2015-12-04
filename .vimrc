set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-scripts/taglist.vim'

call vundle#end()            " required

filetype plugin indent on    " required
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to
"auto-approve removal

" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
syntax on
set ruler
set number
set incsearch

set colorcolumn=+1 " highlights the column after textwidth (80, usually)

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
set guifont=Monospace\ 10
set t_Co=256
if has('gui_running')
	" colorscheme solarized
	colorscheme jellybeans
else
	colorscheme delek
endif

" spell check"
au BufNewFile,BufRead *.markdown,*.md,*.dox,COMMIT_EDITMSG,README,CHANGELOG,INSTALL setlocal spell
" :setlocal spell spelllang=en_us
" :set spell

" ctags taglist
let Tlist_WinWidth = 50
map <F4> :TlistToggle<cr>

" space to go into command mode
nnoremap <space> :
" ö for visiting marks
nnoremap ö `

" Work up the directory tree to find 'tags'
set tags =./tags;/
" Pathogen
execute pathogen#infect()
call pathogen#helptags()

set scrolloff=4
set wildmode=list:longest
set laststatus=2
set relativenumber
set statusline=%02n:\ %<%f\ [%{GetFileInfo()}]\ \ %m%r%h%=%-14.(%l:%c%V%)\ %P
au BufNewFile,BufRead *.install set filetype=php
au BufNewFile,BufRead *.rs set filetype=rust
au BufWritePost *.c,*.cpp,*.h,*.py,*.rs silent! !ctags -R * &

" remap <esc> to jj
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

" Highlight trailing WS
:highlight ExtraWhitespace ctermbg=red guibg=red
autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/ containedin=ALL

" borrowed from https://github.com/bronson/vim-trailing-whitespace/blob/master/plugin/trailing-whitespace.vim
function! s:Fws(line1,line2)
    let l:save_cursor = getpos(".")
    silent! execute ':' . a:line1 . ',' . a:line2 . 's/\s\+$//'
    call setpos('.', l:save_cursor)
endfunction

" Run :Fws to remove end of line white space.
command! -range=% Fws call <SID>Fws(<line1>,<line2>)

cmap w!! w !sudo tee % >/dev/null<CR>

"let c_C99 = 1

let g:ycm_register_as_syntastic_checker = 0 " This prevents YCM from overriding the options below
" syntastic checker config
let g:syntastic_c_checkers=['gcc', 'splint', 'make']
let g:syntastic_c_compiler='gcc'
let g:syntastic_c_compiler_options='-Wall -Werr -Wextra'
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'

" UltiSnips config
let g:UltiSnipsExpandTrigger="§"

"Highlight unexpected characters
"This makes mixed tabs and spaces obvious (important for python), and
"OS X in particular is awesome at adding non-breaking spaces unexpectedly
set list
set listchars=tab:↦\ ,extends:↷,precedes:↶,nbsp:¬
