""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin()

" theming
Plug 'joshdick/onedark.vim'
Plug 'vim-airline/vim-airline'

" code navigation
Plug 'francoiscabrol/ranger.vim'
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
Plug 'mhinz/vim-sayonara/'
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
" airline
let g:airline#extensions#hunks#enabled = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 0
let g:airline_powerline_fonts=1
let g:airline_theme='onedark'

" ale
let g:ale_python_flake8_options = '--max-line-length 120'
let g:ale_linters = {
\   'python': ['autopep8', 'flake8', 'isort', 'pylint', 'yapf'],
\}

" better whitespace
let g:strip_whitespace_on_save = 1

" deoplete
let g:jedi#completions_enabled = 0
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#sources#jedi#server_timeout = 2

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
" sayonara
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <C-c> :Sayonara!<cr>
