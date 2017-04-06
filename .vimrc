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

  " file management/nav
  call dein#add('junegunn/fzf', { 'build': './install --all', 'merged': 0 })
  call dein#add('junegunn/fzf.vim')

  " completions
  call dein#add('Shougo/neocomplete.vim')
  call dein#add('davidhalter/jedi-vim')
  call dein#add('raimondi/delimitMate')                " automatic delimiter matching
  call dein#add('ludovicchabant/vim-gutentags')        " automatic ctags

  " tpope-esque
  call dein#add('tpope/vim-commentary')                " toggle commmenting
  call dein#add('tpope/vim-fugitive')	               " git support
  call dein#add('tpope/vim-repeat')                    " more predictable . repeats
  call dein#add('tpope/vim-sensible')                  " sane defaults
  call dein#add('tpope/vim-surround')                  " add/edit/remove surroundings
  call dein#add('tpope/vim-unimpaired')                " misc
  call dein#add('AndrewRadev/splitjoin.vim')
  call dein#add('ntpeters/vim-better-whitespace')
  call dein#add('peterrincker/vim-argumentative')      " manipulate arguments
  call dein#add('wellle/targets.vim')                  " includes things like <da,>

  " ui
  call dein#add('majutsushi/tagbar')                   " file structure overview
  call dein#add('mhinz/vim-signify')                   " git diff in gutter
  call dein#add('vim-airline/vim-airline')
  " call dein#add('vim-airline/vim-airline-themes')

  " python
  call dein#add('hynek/vim-python-pep8-indent')
  call dein#add('fisadev/vim-isort')

  " golang
  call dein#add('fatih/vim-go')

  call dein#end()
  call dein#save_state()
endif

" tagbar settings
let g:tagbar_left = 1
nnoremap <F8> :TagbarToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" personal settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" misc settings
set clipboard=unnamed
set mouse=a
set visualbell

" visual settings
set nowrap
set number
set cursorline

" split settigns
set splitbelow
set splitright

" whitespace settings
set shiftwidth=4
set tabstop=4
set softtabstop=4
autocmd BufEnter * EnableStripWhitespaceOnSave

" fold settings
set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=indent
nnoremap <space> za

" misc mappings
nnoremap Y y$
nnoremap B ^
nnoremap E $
nnoremap <c-p> :GFiles<cr>
nnoremap <F5> :source ~/.vimrc<cr>

" netrw
let g:netrw_banner = 0  " hide the top banner
let g:netrw_liststyle = 3  " tree style listing
let g:netrw_winsize = 25
" let g:netrw_browse_split = 4  " file opens in previous window (so netrw persists)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" testing playground
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"

"Fix E121: Undefined variable: g:neocomplete#force_omni_input_patterns
if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif

" enable jedi-vim
autocmd FileType python setlocal omnifunc=jedi#completions
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
let g:neocomplete#force_omni_input_patterns.python = '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'
" alternative pattern: '\h\w*\|[^. \t]\.\w*'
