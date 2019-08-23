"""" .vimrc

if &compatible
    set nocompatible
endif


"""" dein
source ~/nvimfiles/dein.rc.vim


"""" vim-plug
" source ~/nvimfiles/vim-plug.rc.vim


"""" Python provider
if has('mac')
    let g:python_host_prog  = '/usr/local/var/pyenv/versions/py2neovim/bin/python'
    let g:python3_host_prog = '/usr/local/var/pyenv/versions/py3neovim/bin/python'
elseif has('win32') || has('win64')
    let g:python3_host_prog = $HOMEPATH.'\nvimenv\pynvim\Scripts\python'
endif

"""" Ruby provider
if has('mac')
    let g:ruby_host_prog = '/usr/local/bin/neovim-ruby-host'
endif

"""" Node.js provider
if has('mac')
    let g:node_host_prog = '~/.nodebrew/current/bin/neovim-node-host'
endif


"""" Common setting
filetype plugin indent on
syntax enable

set cursorline
set tabstop=4
set shiftwidth=4
set backup
set swapfile
set number
set autochdir
set clipboard=unnamed
set encoding=utf-8
set expandtab
set hidden
set wildmenu
set wildignorecase
set ignorecase
set smartcase
set conceallevel=0
set fileformats=unix,dos,mac
set fileencodings=utf-8,sjis

set tags=.tags;~

set backupdir=~/nvimbackup
set directory=~/nvimbackup

set noundofile
if has('persistent_undo')
    set undodir=~/nvimundo
    set undofile
endif

hi clear CursorLine


"""" Key mapping
source ~/nvimfiles/mappings.rc.vim
" noremap <Up>    <Nop>
" noremap <Down>  <Nop>
" noremap <Left>  <Nop>
" noremap <Right> <Nop>
" inoremap <Up>    <Nop>
" inoremap <Down>  <Nop>
" inoremap <Left>  <Nop>
" inoremap <Right> <Nop>
" inoremap <silent> jj <ESC>
" noremap <S-h>   ^
" noremap <S-j>   }
" noremap <S-k>   {
" noremap <S-l>   $
" nnoremap s <Nop>
" noremap j gj
" noremap k gk
" nnoremap sj <C-w>j
" nnoremap sk <C-w>k
" nnoremap sl <C-w>l
" nnoremap sh <C-w>h
" nnoremap sJ <C-w>J
" nnoremap sK <C-w>K
" nnoremap sL <C-w>L
" nnoremap sH <C-w>H
" nnoremap sn gt
" nnoremap sp gT
" nnoremap s= <C-w>=
" nnoremap sN :<C-u>bn<CR>
" nnoremap sP :<C-u>bp<CR>
" nnoremap st :<C-u>tabnew<CR>
" nnoremap ss :<C-u>sp<CR>
" nnoremap sv :<C-u>vs<CR>
" nnoremap sq :<C-u>q<CR>
" nnoremap sd :<C-u>bd<CR>
" nnoremap [q :cprevious<CR>
" nnoremap ]q :cnext<CR>
" tnoremap <ESC> <C-\><C-n>
" tnoremap <silent> jj <C-\><C-n>

"""" Define commands
command! TagsGenerate execute 'silent !ctags -R -f .tags'

"""" Define functions
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

"""" Autocmd
augroup ctags
    autocmd!
    autocmd BufWritePost * call s:execute_ctags()
augroup END

"""" Load local init.vim
if filereadable(expand('~/nvimfiles/local_init.vim'))
    execute 'source' expand('~/nvimfiles/local_init.vim')
endif
