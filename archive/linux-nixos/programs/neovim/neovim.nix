{ pkgs, ... }:

{
  enable = false;
  withPython3 = true;
  extraPython3Packages = ps: with ps; [
    python-language-server
    pyls-black
    pyls-isort
    pyls-mypy
  ];
  plugins = [
    # theming
    pkgs.vimPlugins.neodark-vim
    pkgs.vimPlugins.vim-airline
    pkgs.vimPlugins.vim-airline-themes

    # code navigation
    pkgs.vimPlugins.ranger-vim
    pkgs.vimPlugins.fzf-vim

    # editor ui
    pkgs.vimPlugins.vim-signify
    pkgs.vimPlugins.coc-nvim
    pkgs.vimPlugins.coc-go
    pkgs.vimPlugins.coc-python
    pkgs.vimPlugins.coc-tsserver

    # vim enhancements
    pkgs.vimPlugins.vim-sayonara
    pkgs.vimPlugins.vim-abolish
    pkgs.vimPlugins.vim-commentary
    pkgs.vimPlugins.vim-fugitive
    pkgs.vimPlugins.vim-repeat
    pkgs.vimPlugins.vim-rhubarb
    pkgs.vimPlugins.vim-surround
    pkgs.vimPlugins.vim-unimpaired

    # editing enhancements
    pkgs.vimPlugins.vim-cursorword
    pkgs.vimPlugins.auto-pairs
    pkgs.vimPlugins.vim-better-whitespace
    pkgs.vimPlugins.vim-swap
    pkgs.vimPlugins.targets-vim

    # language specific
    pkgs.vimPlugins.vim-go
    pkgs.vimPlugins.vim-nix
    pkgs.vimPlugins.yats-vim

    # TODOs
    # salt-vim
    # split-join
    # sudo-edit
  ];
  extraConfig = ''
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " augroups
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " irrelevant when using nix
    " augroup VIMRC_AUTO_RELOAD
    "     autocmd!
    "     autocmd bufwritepost $MYVIMRC source $MYVIMRC
    " augroup end

    " augroup COC_SHOW_SIGNATURE_HELPER
    "     autocmd!
    "     autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
    " augroup end

    " augroup GOIMPORTS
    "     autocmd!
    "     autocmd BufWritePre *.go call go#auto#fmt_autosave()
    " augroup end

    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " appearance / behavior
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    map <C-l> <silent>

    colorscheme neodark

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

    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " plugin overrides
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " airline
    let g:airline#extensions#branch#enabled = 0
    let g:airline#extensions#hunks#enabled = 0
    let g:airline#extensions#tabline#enabled = 0
    let g:airline#extensions#virtualenv#enabled = 0
    let g:airline_powerline_fonts=1
    let g:airline_theme='onedark'

    " better whitespace
    let g:better_whitespace_enabled = 0
    let g:strip_whitelines_at_eof = 1
    let g:strip_whitespace_confirm = 0
    let g:strip_whitespace_on_save = 1

    " fzf.vim
    let g:fzf_preview_window = ""

    " vim-go
    let g:go_fmt_command = "goimports"
    let g:go_code_completion_enabled = 0  " use coc.nvim instead
    let g:go_def_mapping_enabled = 0
    let g:go_list_height = 0

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
    " ranger
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    command! Ranger call RangerEdit("edit")

    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " sayonara
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    map <C-c> :Sayonara!<cr>

    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " vim-swap
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    omap i, <Plug>(swap-textobject-i)
    xmap i, <Plug>(swap-textobject-i)
    omap a, <Plug>(swap-textobject-a)
    xmap a, <Plug>(swap-textobject-a)
  '';
}
