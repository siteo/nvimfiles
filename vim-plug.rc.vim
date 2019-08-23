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
    Plug 'junegunn/vim-plug', {'dir': '~/.nvim/vim-plug/autoload'}
    Plug 'cocopon/iceberg.vim', {'do': ':colorscheme iceberg'}
    Plug 'scrooloose/nerdtree' | Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'scrooloose/nerdcommenter'
    Plug 'neoclide/coc.nvim', {'branch':'release'}
    Plug 'honza/vim-snippets'
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
    Plug 'junegunn/fzf', has('win32') ? {'dir': '~/.fzf'} : {'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    Plug 'mbbill/undotree'
    Plug 'majutsushi/tagbar'

    Plug 'mattn/emmet-vim', {'for': ['html', 'javascript']}
    Plug 'pangloss/vim-javascript', {'for': 'javascript'}
    Plug 'MaxMEllon/vim-jsx-pretty', {'for': 'javascript'}
    Plug 'tpope/vim-markdown', {'for': 'markdown'}
call plug#end()


" colorscheme
colorscheme iceberg

" nerdtree / nerdtree-git-plugins
source ~/nvimfiles/plugins/nerdtree.rc.vim
source ~/nvimfiles/plugins/nerdtree-git-plugin.rc.vim

" coc
source ~/nvimfiles/plugins/coc.rc.vim

" vim-submode
source ~/nvimfiles/plugins/submode.rc.vim

" gitplug
source ~/nvimfiles/plugins/gitplug.rc.vim

" vim-indent-guides
source ~/nvimfiles/plugins/vim-indent-guides.rc.vim

" vim-airline / vim-airline-themes
source ~/nvimfiles/plugins/vim-airline.rc.vim
let g:airline_theme='jellybeans'

" ale
source ~/nvimfiles/plugins/ale.rc.vim

" vim-easymotion
source ~/nvimfiles/plugins/easymotion.rc.vim

" fzf.vim
source ~/nvimfiles/plugins/fzf.rc.vim

" emmet-vim
source ~/nvimfiles/plugins/emmet.rc.vim

" vim-markdown
let g:previm_open_cmd = 'open -a Google\ Chrome'

" undotree
nnoremap <F5> :UndotreeToggle<CR>

