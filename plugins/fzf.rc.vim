let g:fzf_command_prefix = 'Fzf'

nnoremap [Fzf] <Nop>
nmap <Space>f [Fzf]

nnoremap <silent> [Fzf]f :<C-u>FzfFiles<CR>
nnoremap <silent> [Fzf]g :<C-u>FzfGFiles<CR>
nnoremap <silent> [Fzf]s :<C-u>FzfGFiles?<CR>
nnoremap <silent> [Fzf]b :<C-u>FzfBuffers<CR>
nnoremap <silent> [Fzf]c :<C-u>FzfCommands<CR>
nnoremap <silent> [Fzf]l :<C-u>FzfLines<CR>
nnoremap <silent> [Fzf]h :<C-u>FzfHistory<CR>
nnoremap <silent> [Fzf]a :<C-u>FzfAg<CR>

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" Advanced customization using autoload functions
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})

let g:fzf_colors =
    \ { 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Comment'],
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \ 'hl+':     ['fg', 'Statement'],
      \ 'info':    ['fg', 'PreProc'],
      \ 'border':  ['fg', 'Ignore'],
      \ 'prompt':  ['fg', 'Conditional'],
      \ 'pointer': ['fg', 'Exception'],
      \ 'marker':  ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Label'],
      \ 'header':  ['fg', 'Comment'] }

let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
let g:fzf_history_dir = '~/.nvim/fzf-history'
