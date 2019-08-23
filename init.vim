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
