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
    Plug 'junegunn/vim-easy-align'
    Plug 'Shougo/denite.nvim' | Plug 'Shougo/neomru.vim'
    Plug 'Shougo/defx.nvim'
    Plug 'Shougo/deoplete.nvim' | Plug 'tbodt/deoplete-tabnine'
    Plug 'cocopon/iceberg.vim', {'do': ':colorscheme iceberg'}
    Plug 'sheerun/vim-polyglot'
    Plug 'jiangmiao/auto-pairs'
    Plug 'kana/vim-submode'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-repeat'
    Plug 'airblade/vim-gitgutter'
    Plug 'Yggdroot/indentLine'
    Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
    Plug 'kshenoy/vim-signature'
    Plug 'dense-analysis/ale'
    Plug 'easymotion/vim-easymotion'

    " Ondemand loading
    Plug 'mbbill/undotree', {'on': 'UndotreeToggle'}
    Plug 'junegunn/goyo.vim', {'on': 'Goyo'}
    Plug 'junegunn/gv.vim', {'on': 'GV'}
    Plug 'junegunn/limelight.vim', {'on': 'Limelight'}
    Plug 'mattn/emmet-vim', {'for': ['javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'html'] }
    Plug 'Shougo/neco-vim', {'for': ['vim'] }
    Plug 'majutsushi/tagbar', {'on': 'Tagbar'}
    Plug 'previm/previm', {'on': 'PrevimOpen'} | Plug 'tyru/open-browser.vim'
    Plug 'dhruvasagar/vim-table-mode', {'on': 'TableModeToggle'}
    Plug 'ap/vim-css-color', {'for': ['css']}
    Plug 'AndrewRadev/linediff.vim', {'on': 'Linediff'}
    Plug 'schickling/vim-bufonly', {'on': 'BufOnly'}
    Plug 'kien/rainbow_parentheses.vim', {'on': 'RainbowParenthesesToggle'}
call plug#end()

" denite
source ~/nvimfiles/plugins/denite.rc.vim

" defx
source ~/nvimfiles/plugins/defx.rc.vim

" deoplete
source ~/nvimfiles/plugins/deoplete.rc.vim

" colorscheme
colorscheme iceberg

" vim-submode
source ~/nvimfiles/plugins/submode.rc.vim

" vim-fugitive
source ~/nvimfiles/plugins/fugitive.rc.vim

" vim-gitgutter
source ~/nvimfiles/plugins/gitgutter.rc.vim

" indentLine
let g:indentLine_char_list = ['|', '¦']

" vim-airline / vim-airline-themes
source ~/nvimfiles/plugins/vim-airline.rc.vim
let g:airline_theme='jellybeans'

" ale
source ~/nvimfiles/plugins/ale.rc.vim

" vim-easymotion
source ~/nvimfiles/plugins/easymotion.rc.vim

" emmet-vim
source ~/nvimfiles/plugins/emmet.rc.vim

" vim-markdown
let g:previm_open_cmd = 'open -a Google\ Chrome'

" undotree
nnoremap <F5> :UndotreeToggle<CR>

" vim-table-mode
let g:table_mode_corner = '|'

" easyalign
source ~/nvimfiles/plugins/easyalign.rc.vim
