"""" vim-plug
let s:plug_dir = expand('~/.nvim/vim-plug')
let s:plug_autoload_dir = s:plug_dir . '/autoload'
let s:plug_repo_dir = expand('~/.nvim/plugins')

if has('vim_starting')
    let &runtimepath = s:plug_dir . ',' . &runtimepath
    if !isdirectory(s:plug_autoload_dir)
        echo 'install vim-plug...'
        call system('mkdir -p ' . s:plug_autoload_dir)
        call system('git clone https://github.com/junegunn/vim-plug.git ' . s:plug_autoload_dir)
    endif
    if !isdirectory(s:plug_repo_dir)
        call system('mkdir -p ' . s:plug_repo_dir)
    endif
endif

call plug#begin(s:plug_repo_dir)
    Plug 'cocopon/iceberg.vim', {'do': ':colorscheme iceberg'}
    Plug 'scrooloose/nerdtree'
    Plug 'Shougo/denite.nvim' | Plug 'Shougo/neomru.vim'
    Plug 'neoclide/coc.nvim', {'do': {-> coc#util#install()}}
    Plug 'cohama/lexima.vim'
    Plug 'kana/vim-submode'
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'
    Plug 'nathanaelkane/vim-indent-guides'
    Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
    Plug 'tpope/vim-surround'
    Plug 'kshenoy/vim-signature'
    Plug 'w0rp/ale'
    Plug 'easymotion/vim-easymotion'
    Plug 'previm/previm'

    Plug 'mattn/emmet-vim', {'for': ['html', 'javascript']}
    Plug 'pangloss/vim-javascript', {'for': 'javascript'}
    Plug 'MaxMEllon/vim-jsx-pretty', {'for': 'javascript'}
    Plug 'tpope/vim-markdown', {'for': 'markdown'}
call plug#end()

" colorscheme
colorscheme iceberg

" nerdtree
source ~/nvimfiles/plugins/nerdtree.rc.vim

" denite
source ~/nvimfiles/plugins/denite.rc.vim

" coc
source ~/nvimfiles/plugins/coc.rc.vim

" vim-submode
source ~/nvimfiles/plugins/submode.rc.vim

" vim-fugitive
source ~/nvimfiles/plugins/vim-fugitive.rc.vim

" vim-gitgutter
source ~/nvimfiles/plugins/vim-gitgutter.rc.vim

" vim-indent-guides
source ~/nvimfiles/plugins/vim-indent-guides.rc.vim

" vim-airline
source ~/nvimfiles/plugins/vim-airline.rc.vim

" vim-airline-themes
let g:airline_theme='jellybeans'

" ale
source ~/nvimfiles/plugins/ale.rc.vim

" vim-easymotion
source ~/nvimfiles/plugins/easymotion.rc.vim

" emmet-vim
source ~/nvimfiles/plugins/emmet.rc.vim

" vim-markdown
let g:previm_open_cmd = 'open -a Google\ Chrome'


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
inoremap <Up>    <Nop>
inoremap <Down>  <Nop>
inoremap <Left>  <Nop>
inoremap <Right> <Nop>
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
nnoremap s= <C-w>=
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
