set t_Co=256
set laststatus=2
set showtabline=2
if has('mac')
    let g:airline_powerline_fonts = 1
elseif has('win32') || has('win64')
    let g:airline_powerline_fonts = 0
endif
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#whitespace#mixed_indent_algo = 1
let g:airline#extensions#ale#enabled = 1
