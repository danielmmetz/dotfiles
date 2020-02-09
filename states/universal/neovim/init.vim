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

" editor ui
Plug 'mhinz/vim-signify'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

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
Plug 'ntpeters/vim-better-whitespace'
Plug 'peterrincker/vim-argumentative'
Plug 'wellle/targets.vim'

" language specific
Plug 'fatih/vim-go',                 { 'for': 'go' }
Plug 'saltstack/salt-vim',           { 'for': 'sls' }
Plug 'HerringtonDarkholme/yats.vim', { 'for': 'tsx' }
Plug 'LnL7/vim-nix',                 { 'for': 'nix' }

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" augroups
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup VIMRC_AUTO_RELOAD
    autocmd!
    autocmd bufwritepost $MYVIMRC source $MYVIMRC
augroup end

augroup COC_SHOW_SIGNATURE_HELPER
    autocmd!
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
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

" better whitespace
let g:better_whitespace_enabled = 0
let g:strip_whitelines_at_eof = 1
let g:strip_whitespace_confirm = 0
let g:strip_whitespace_on_save = 1

" vim-go
let g:go_fmt_command = "goimports"
let g:go_code_completion_enabled = 0  " use coc.nvim instead
let g:go_def_mapping_enabled = 0
let g:go_list_height = 0

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

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

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
" coc.nvim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>r <Plug>(coc-rename)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" tagbar
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <silent> <C-t> :TagbarToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" sayonara
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <C-c> :Sayonara!<cr>
