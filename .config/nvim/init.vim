""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:plug_window = 'enew'

call plug#begin()

" ui enhancements
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'rakr/vim-one'
Plug 'joshdick/onedark.vim'

" code navigation
Plug 'junegunn/fzf',                 { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'ludovicchabant/vim-gutentags'

" completion & linting
Plug 'Shougo/deoplete.nvim',         { 'do': ':UpdateRemotePlugins' }

" vim enhancements
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'

" editing enhancements
Plug 'AndrewRadev/splitjoin.vim'
Plug 'junegunn/vim-easy-align'
Plug 'ntpeters/vim-better-whitespace'
Plug 'peterrincker/vim-argumentative'
Plug 'raimondi/delimitMate'
Plug 'wellle/targets.vim'
Plug 'itchyny/vim-cursorword'

" language specific
Plug 'fatih/vim-go',                 { 'for': 'go' }
Plug 'fisadev/vim-isort',            { 'for': 'python' }
Plug 'hynek/vim-python-pep8-indent', { 'for': 'python' }
Plug 'zchee/deoplete-go',            { 'for': 'go' }
Plug 'zchee/deoplete-jedi',          { 'for': 'python' }

call plug#end()
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" augroups
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup VIMRC_AUTO_RELOAD
    autocmd!
    autocmd bufwritepost $MYVIMRC source $MYVIMRC
augroup end

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" appearance / behavior
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme onedark

set clipboard^=unnamed,unnamedplus
set cursorline
set visualbell
set inccommand=nosplit

set nowrap
set number
set relativenumber
set splitbelow
set splitright

set shiftwidth=4
set tabstop=4
set softtabstop=4
set smartindent
set smarttab

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" plugin overrides
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='onedark'

" better whitespace
let g:strip_whitespace_on_save = 1

" deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" misc key maps
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap Y y$
nnoremap B ^
nnoremap E $

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" easy align
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" fzf
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <C-p> :GFiles<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TODOs
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" coding experience
" - neomake/neomake for linting
" - sirver/ultisnips for snippets (with honza/vim-snippets for more snippets)

" file/folders structure
" - majutsushi/tagbar for filestructure overview
" - scrooloose/nerdtree for filetree
" - mhinz/vim-signify for git gutter (compare against gitgutter)

" compare against spacevim
