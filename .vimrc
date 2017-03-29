""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" dein.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if &compatible
  set nocompatible
endif
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

if dein#load_state(expand('~/.vim/dein'))
  call dein#begin(expand('~/.vim/dein'))

  call dein#add('Shougo/dein.vim')
  call dein#add('Shougo/neocomplete.vim')
  call dein#add('tpope/vim-commentary')
  call dein#add('tpope/vim-repeat')
  call dein#add('tpope/vim-sensible')
  call dein#add('tpope/vim-surround')
  call dein#add('tpope/vim-unimpaired')
  call dein#add('AndrewRadev/splitjoin.vim')
  call dein#add('junegunn/fzf', { 'build': './install --all', 'merged': 0 })
  call dein#add('junegunn/fzf.vim')
  call dein#add('fatih/vim-go')

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" personal settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" misc settings
set clipboard=unnamed
set mouse=a

" visual settings
set nowrap
set number
set cursorline

" tab settings
set shiftwidth=4
set tabstop=4
set softtabstop=4

" fold settings
set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=indent
nnoremap <space> za

" misc mappings
nmap Y y$

" netrw
let g:netrw_banner = 0  " hide the top banner
let g:netrw_liststyle = 3  " tree style listing
let g:netrw_browse_split = 4  " file opens in previous window (so netrw persists)
let g:netrw_winsize = 25
augroup ProjectDrawer  " file drawer on start
  autocmd!
  autocmd VimEnter * :Vexplore
augroup END

