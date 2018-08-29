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
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }
Plug 'mhinz/vim-signify'
Plug 'roxma/nvim-completion-manager'
Plug 'w0rp/ale'

" vim enhancements
Plug 'chrisbra/SudoEdit.vim'
Plug 'mhinz/vim-sayonara/'
Plug 'tpope/vim-abolish'
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
Plug 'ambv/black',                   { 'for': 'python' }
Plug 'saltstack/salt-vim',           { 'for': 'sls' }
Plug 'sheerun/vim-polyglot'

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

set autoread
set clipboard^=unnamed,unnamedplus
set cursorline
set visualbell
set mouse=a
set inccommand=nosplit

set nowrap
set number
set splitbelow
set splitright

set expandtab
set shiftwidth=4
set softtabstop=4
set smarttab
set tabstop=4

let g:python_host_prog = '/Users/dmetz/.venvs/neovim2/bin/python'
let g:python3_host_prog = '/Users/dmetz/.venvs/neovim3/bin/python'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" plugin overrides
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" airline
let g:airline#extensions#branch#enabled = 0
let g:airline#extensions#hunks#enabled = 0
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#tagbar#enabled = 0
let g:airline#extensions#virtualenv#enabled = 0
let g:airline_powerline_fonts=1
let g:airline_theme='onedark'

" ale
let g:ale_python_flake8_options = '--max-line-length 120'
let g:ale_linters = {
\   'fish': [],
\   'go': ['gofmt', 'goimports', 'go vet', 'gotype', 'go build', 'gosimple', 'staticcheck'],
\   'python': ['autopep8', 'black', 'flake8', 'isort'],
\}
let g:ale_fixers = {
\   'go': ['gofmt', 'goimports'],
\   'python': ['black', 'isort'],
\}

" black
let g:black_linelength = 120
let g:black_virtualenv = '/Users/dmetz/.venvs/neovim3'

" better whitespace
let g:strip_whitespace_on_save = 1

" language client
let g:LanguageClient_diagnosticsEnable = 0
let g:LanguageClient_serverCommands = { 'go': ['go-langserver'], 'python': ['get-pyls'] }

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
nnoremap <C-n> :noh<CR>

tnoremap <Esc> <C-\><C-n>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ale
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
nmap <silent> <C-s> :ALEFix<CR>

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
nnoremap <C-b> :Buffers<cr>
nnoremap <C-p> :GFiles<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nvim-completion-manager
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <leader>d :call LanguageClient_textDocument_definition()<Cr>
nnoremap <silent> <leader>n :call LanguageClient_textDocument_references()<CR>
nnoremap <silent> <leader>r :call LanguageClient_textDocument_rename()<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" tagbar
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <silent> <C-t> :TagbarToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" sayonara
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <C-c> :Sayonara!<cr>
