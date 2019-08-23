" dein configurations.

let g:dein#install_log_filename = '~/.nvim/dein.log'

let s:cache_home = expand('~/.nvim')

let s:dein_dir = s:cache_home . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein_repo_dir)
    call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif
let &runtimepath = s:dein_repo_dir .",". &runtimepath

let s:toml_file = expand('~/nvimfiles/dein.toml')
let s:toml_lazy_file = expand('~/nvimfiles/dein_lazy.toml')
let s:toml_filetype = expand('~/nvimfiles/dein_ft.toml')
if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir)
    call dein#load_toml(s:toml_file,{'lazy':0})
    call dein#load_toml(s:toml_lazy_file,{'lazy':1})
    call dein#load_toml(s:toml_filetype)
    call dein#end()
    call dein#save_state()
endif
