""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin()

" theming
Plug 'itchyny/lightline.vim'
Plug 'joshdick/onedark.vim'

" code navigation
Plug 'junegunn/fzf',                 { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'majutsushi/tagbar'

" editor ui
Plug 'mhinz/vim-signify'
Plug 'Shougo/deoplete.nvim',         { 'do': ':UpdateRemotePlugins' }
Plug 'w0rp/ale'

" vim enhancements
Plug 'chrisbra/SudoEdit.vim'
Plug 'qpkorr/vim-bufkill'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'

" editing enhancements
Plug 'AndrewRadev/splitjoin.vim'
Plug 'itchyny/vim-cursorword'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/vim-easy-align'
Plug 'ntpeters/vim-better-whitespace'
Plug 'peterrincker/vim-argumentative'
Plug 'wellle/targets.vim'

" language specific
Plug 'zchee/deoplete-go',            { 'do': 'make' }
Plug 'fatih/vim-go',                 { 'for': 'go' }
Plug 'davidhalter/jedi-vim',         { 'for': 'python' }
Plug 'fisadev/vim-isort',            { 'for': 'python' }
Plug 'hynek/vim-python-pep8-indent', { 'for': 'python' }
Plug 'zchee/deoplete-jedi',          { 'for': 'python' }
Plug 'keith/swift.vim',              { 'for': 'swift' }

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
map <C-l> <silent>

colorscheme onedark

set clipboard^=unnamed,unnamedplus
set cursorline
set visualbell
set mouse=a
set inccommand=nosplit

set nowrap
set number
set relativenumber
set splitbelow
set splitright
set textwidth=120

set expandtab
set shiftwidth=4
set softtabstop=4
set smartindent
set smarttab
set tabstop=4

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" plugin overrides
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ale
let g:ale_python_flake8_options = '--max-line-length 120'
let g:ale_linters = {
\   'python': ['autopep8', 'flake8', 'isort', 'pylint', 'yapf'],
\}

" better whitespace
let g:strip_whitespace_on_save = 1

" lightline
let g:lightline = {'colorscheme': 'one'}

" deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1

" tagbar
let g:tagbar_left = 1

" vim-plug
let g:plug_window = 'enew'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" misc key maps
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap Y y$
nnoremap B ^
nnoremap E $

tnoremap <Esc> <C-\><C-n>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ale
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" bufkill
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <C-c> :BD<cr>

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
" tagbar
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <silent> <C-t> :TagbarToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TODOs
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" mhinz/vim-grepper for better grepping
