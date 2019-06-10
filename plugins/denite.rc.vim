nnoremap [denite] <Nop>
nmap <Space>d [denite]

nnoremap <silent> [denite]f :<C-u>Denite file<CR>
nnoremap <silent> [denite]n :<C-u>Denite file:new -start-filter<CR>
nnoremap <silent> [denite]r :<C-u>Denite file/rec -vertical-preview<CR>
nnoremap <silent> [denite]m :<C-u>Denite file_mru -start-filter -vertical-preview<CR>
nnoremap <silent> [denite]b :<C-u>Denite buffer -vertical-preview<CR>
nnoremap <silent> [denite]c :<C-u>Denite change<CR>
nnoremap <silent> [denite]l :<C-u>Denite line -vertical-preview<CR>
nnoremap <silent> [denite]t :<C-u>Denite tag<CR>
nnoremap <silent> [denite]e :<C-u>Denite menu<CR>
nnoremap <silent> [denite]g :<C-u>Denite grep -vertical-preview<CR>

call denite#custom#var('file/rec', 'command',
    \ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])

autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
    nnoremap <silent><buffer><expr> <CR>
    \ denite#do_map('do_action')
    nnoremap <silent><buffer><expr> d
    \ denite#do_map('do_action', 'delete')
    nnoremap <silent><buffer><expr> p
    \ denite#do_map('do_action', 'preview')
    nnoremap <silent><buffer><expr> q
    \ denite#do_map('quit')
    nnoremap <silent><buffer><expr> i
    \ denite#do_map('open_filter_buffer')
    nnoremap <silent><buffer><expr> <Space>
    \ denite#do_map('toggle_select').'j'
endfunction

let s:menus = {}

let s:menus.diff = {
    \ 'description' : 'Showing differences between two, three or four versions of the same file.'
    \ }
let s:menus.diff.command_candidates = [
    \ ['Diff this', 'diffthis'],
    \ ['Diff off', 'diffoff'],
    \ ['Diff update', 'diffupdate'],
    \ ]

call denite#custom#var('menu', 'menus', s:menus)
