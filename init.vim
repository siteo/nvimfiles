"""" dein.vim
if !&compatible
    set nocompatible
endif

let s:cache_home = expand('~/.nvim')

let s:dein_dir = s:cache_home . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein_repo_dir)
    call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif
let &runtimepath = s:dein_repo_dir .",". &runtimepath

" Load plugins and make cache
let s:toml_file = fnamemodify(expand('<sfile>'), ':h').'/dein.toml'
let s:toml_lazy_file = fnamemodify(expand('<sfile>'), ':h').'/dein_lazy.toml'
if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir)
    call dein#load_toml(s:toml_file,{'lazy':0})
    call dein#load_toml(s:toml_lazy_file,{'lazy':1})
    call dein#end()
    call dein#save_state()
endif

" Install plugins
if has('vim_starting') && dein#check_install()
    call dein#install()
endif

"""" Python provider
if has('mac')
    let g:python_host_prog  = '/usr/local/var/pyenv/versions/py2neovim/bin/python'
    let g:python3_host_prog = '/usr/local/var/pyenv/versions/py3neovim/bin/python'
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
syntax on

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
noremap <Up>    <Nop>
noremap <Down>  <Nop>
noremap <Left>  <Nop>
noremap <Right> <Nop>
inoremap <silent> jj <ESC>
noremap <S-h>   ^
noremap <S-j>   }
noremap <S-k>   {
noremap <S-l>   $
nnoremap s <Nop>
noremap j gj
noremap k gk
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
nnoremap sn gt
nnoremap sp gT
nnoremap sr <C-w>r
nnoremap s= <C-w>=
nnoremap sw <C-w>w
nnoremap sN :<C-u>bn<CR>
nnoremap sP :<C-u>bp<CR>
nnoremap st :<C-u>tabnew<CR>
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap sq :<C-u>q<CR>
nnoremap sQ :<C-u>bd<CR>
nnoremap [q :cprevious<CR>
nnoremap ]q :cnext<CR>
tnoremap <ESC> <C-\><C-n>
nnoremap <C-h> :vsp<CR> :exe("tjump ".expand('<cword>'))<CR>
nnoremap <C-j> :split<CR> :exe("tjump ".expand('<cword>'))<CR>

nnoremap [VimDiff] <Nop>
nmap <Space>d [VimDiff]
nnoremap <silent> [VimDiff]t :<C-u>diffthis<CR>
nnoremap <silent> [VimDiff]o :<C-u>diffoff<CR>
nnoremap <silent> [VimDiff]u :<C-u>diffupdate<CR>

"""" Define the command
command! TagGenerate execute 'silent !ctags -R -f .tags'
command! DeinPluginsUpdate call dein#update()

"""" Define the function
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
