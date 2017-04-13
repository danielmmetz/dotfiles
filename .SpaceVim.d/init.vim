let g:spacevim_custom_plugins = [
    \ ['fisadev/vim-isort', {'on_ft': 'python'}],
    \ ['tpope/vim-commentary'],
    \ ['ntpeters/vim-better-whitespace', {'on_cmd': 'EnableStripWhitespaceOnSave'}],
    \ ]

set clipboard=unnamed
set nowrap
set splitright splitbelow

nnoremap B ^
nnoremap E $

autocmd BufEnter * EnableStripWhitespaceOnSave
