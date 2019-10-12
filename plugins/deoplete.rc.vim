let g:deoplete#enable_at_startup   = 1
let g:deoplete#auto_complete_delay = 0

inoremap <silent><expr> <TAB>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ deoplete#manual_complete()
inoremap <silent><expr> <CR>
        \ pumvisible() ? deoplete#close_popup() : "\<CR>"
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

inoremap <expr><C-g> deoplete#refresh()
inoremap <expr><C-e> deoplete#cancel_popup()
inoremap <silent><expr><C-l> deoplete#complete_common_string()

call deoplete#custom#option({
            \ 'auto_refresh_delay': 10,
            \ 'camel_case': v:true,
            \ 'skip_multibyte': v:true,
            \ 'prev_completion_mode': 'length',
            \ 'auto_preview': v:true
            \ })

call deoplete#custom#source('ale','rank',600)

call deoplete#custom#option('candidate_marks',
        \ ['1', '2', '3', '4', '5'])
inoremap <expr>1 pumvisible() ? deoplete#insert_candidate(0) : '1'
inoremap <expr>2 pumvisible() ? deoplete#insert_candidate(1) : '2'
inoremap <expr>3 pumvisible() ? deoplete#insert_candidate(2) : '3'
inoremap <expr>4 pumvisible() ? deoplete#insert_candidate(3) : '4'
inoremap <expr>5 pumvisible() ? deoplete#insert_candidate(4) : '5'
