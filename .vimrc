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
  call dein#add('fatih/vim-go')

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" personal settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" settings
set clipboard=unnamed
set mouse=a
set nowrap
set number
set shiftwidth=4
set tabstop=4
set softtabstop=4
set cursorline

" mappings
nmap Y y$

" other
let g:netrw_liststyle=3
let g:netrw_banner=0


let g:netrw_banner = 0
let g:netrw_liststyle = 3
" let g:netrw_browse_split = 4
" let g:netrw_altv = 1
" let g:netrw_winsize = 25
" augroup ProjectDrawer
" 		autocmd!
" 		autocmd VimEnter * :Vexplore
" augroup END
