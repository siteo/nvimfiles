" ========================================================================
" .vimrc
" ========================================================================

if &compatible
  set nocompatible
endif

augroup MyAutoCmd
  autocmd!
augroup END


" ========================================================================
" VIM PLUGIN MANAGER {{{
" ------------------------------------------------------------------------

"""" dein
" source ~/nvimfiles/dein.rc.vim

"""" vim-plug
source ~/nvimfiles/vim-plug.rc.vim

" }}}
" ========================================================================
" Provider configuration {{{
" ========================================================================

" ------------------------------------------------------------------------
" PYTHON PROVIDER
" ------------------------------------------------------------------------
if has('mac')
  let g:python3_host_prog = expand('~/.nvim/pynvim/bin/python')
elseif has('win32') || has('win64')
  let g:python3_host_prog = $HOMEPATH.'\nvimenv\pynvim\Scripts\python'
endif

" ------------------------------------------------------------------------
" RUBY PROVIDER
" ------------------------------------------------------------------------
if has('mac')
  let g:ruby_host_prog = '/usr/local/bin/neovim-ruby-host'
endif

" ------------------------------------------------------------------------
" NODEJS PROVIDER
" ------------------------------------------------------------------------
if has('mac')
  let g:node_host_prog = expand('~/.anyenv/envs/nodenv/versions/12.11.0/bin/neovim-node-host')
endif

" }}}
" ========================================================================
" BASIC SETTINGS {{{
" ========================================================================

filetype plugin indent on
syntax enable

set autoindent
set smartindent
set lazyredraw
set laststatus=2
set showcmd
set cursorline
set tabstop=4
set shiftwidth=0
set backup
set number
set relativenumber
set autochdir
set clipboard=unnamed
set encoding=utf-8
set expandtab smarttab
set hidden
set autoread
set wildmenu
set wildignorecase
set ignorecase smartcase
set conceallevel=0
set fileformats=unix,dos,mac
set fileencodings=utf-8,sjis
set foldenable
set noswapfile
set termguicolors
set virtualedit+=block
set nohlsearch
set updatetime=300
set signcolumn=yes
set cmdheight=2
set shortmess+=c
set showtabline=2

if has('nvim')
  set winblend=15
  set pumblend=15
endif

set tags=.tags;~

set backupdir=~/nvimbackup
set directory=~/nvimbackup

set noundofile
if has('persistent_undo')
  set undodir=~/nvimundo
  set undofile
endif

" }}}
" ========================================================================
" KEY MAPPINGS {{{
" ========================================================================

source ~/nvimfiles/mappings.rc.vim

" }}}
" ========================================================================
" FILETYPE SETTINGS {{{
" ========================================================================

source ~/nvimfiles/filetype.rc.vim

" }}}
" ========================================================================
" COLOR SETTINGS {{{
" ========================================================================

source ~/nvimfiles/color.rc.vim

" }}}
" ========================================================================
" FUNCTIONS & COMMANDS {{{
" ========================================================================

" ------------------------------------------------------------------------
" :TagsGenerate |
" ------------------------------------------------------------------------

function! s:execute_ctags() abort
  let tag_name = '.tags'
  let tags_path = findfile(tag_name, '.;')
  if tags_path ==# ''
    return
  endif

  let tags_dirpath = fnamemodify(tags_path, ':p:h')
  execute 'silent cd' tags_dirpath
  execute 'silent !ctags -R -f' tag_name
endfunction
command! TagsGenerate execute 'silent !ctags -R -f .tags'

" }}}
" ========================================================================
" AUTOCMD {{{
" ========================================================================

" ctags
augroup ctags
  autocmd!
  autocmd BufWritePost * call s:execute_ctags()
augroup END

" }}}
" ========================================================================
" Load local init.vim {{{

if filereadable(expand('~/nvimfiles/local_init.vim'))
  execute 'source' expand('~/nvimfiles/local_init.vim')
endif

" }}}
" ========================================================================
