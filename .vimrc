" No need to hold shift to execute colon commands
nnoremap ; :

" Exit normal mode with jk instead of Escape
inoremap jk <Esc>

nnoremap E $

filetype plugin indent on
" show existing tab with 2 spaces width
set tabstop=2
" when indenting with '>', use 2 spaces width
set shiftwidth=2
" On pressing tab, insert 2 spaces
set expandtab

set backspace=2

syntax on

set clipboard=unnamed

" Enable highlight search
set hlsearch

" Add a marker to see when rows are over 80 characters
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)

" Show characters for spaces and tabs
exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
set list

" Show relative line numbers
set relativenumber

" Unbind the arrow keys
inoremap <Up> <Nop>
nnoremap <Up> <Nop>
vnoremap <Up> <Nop>
inoremap <Down> <Nop>
nnoremap <Down> <Nop>
vnoremap <Down> <Nop>
inoremap <Left> <Nop>
nnoremap <Left> <Nop>
vnoremap <Left> <Nop>
inoremap <Right> <Nop>
nnoremap <Right> <Nop>
vnoremap <Right> <Nop>

" Damian Conway's Die Blinkënmatchen: highlight matches
nnoremap <silent> n n:call HLNext(0.1)<cr>
nnoremap <silent> N N:call HLNext(0.1)<cr>

function! HLNext (blinktime)
  let target_pat = '\c\%#'.@/
  let ring = matchadd('ErrorMsg', target_pat, 101)
  redraw
  exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
  call matchdelete(ring)
  redraw
endfunction

" Clear highlighting on escape in normal mode
nnoremap <esc> :noh<return><esc>
nnoremap <esc>^[ <esc>^[

" Plugins
call plug#begin('~/.vim/plugged')

" vim-javascript
Plug 'pangloss/vim-javascript'

" vim-jsx
Plug 'mxw/vim-jsx'

" Spacegray vim theme
Plug 'ajh17/Spacegray.vim'

" Initialize plugin system
call plug#end()

" Enable JSX in .js files, not just .jsx files
let g:jsx_ext_required = 0

colorscheme spacegray
set termguicolors
