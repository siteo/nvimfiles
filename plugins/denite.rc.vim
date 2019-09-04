nnoremap [Denite] <Nop>
nmap <Space>f [Denite]

nnoremap <silent> [Denite]f :<C-u>Denite file -highlight-matched-char=Special -vertical-preview<CR>
nnoremap <silent> [Denite]n :<C-u>Denite file:new -highlight-matched-char=Underlined<CR>
nnoremap <silent> [Denite]m :<C-u>Denite file_mru -highlight-matched-char=Special -vertical-preview<CR>
nnoremap <silent> [Denite]r :<C-u>Denite file/rec -highlight-matched-char=Special -vertical-preview<CR>
nnoremap <silent> [Denite]o :<C-u>Denite outline -highlight-matched-char=Special<CR>
nnoremap <silent> [Denite]p :<C-u>DeniteProjectDir file/rec -highlight-matched-char=Special<CR>
nnoremap <silent> [Denite]b :<C-u>Denite buffer -highlight-matched-char=Special -vertical-preview<CR>
nnoremap <silent> [Denite]g :<C-u>Denite grep -highlight-matched-char=Special -vertical-preview<CR>
nnoremap <silent> [Denite]l :<C-u>Denite line -highlight-matched-char=Speial<CR>
nnoremap <silent> [Denite]j :<C-u>Denite -resume -cursor-pos=+1 -immediately<CR>
nnoremap <silent> [Denite]k :<C-u>Denite -resume -cursor-pos=-1 -immediately<CR>
nnoremap <silent> [Denite]v :<C-u>Denite -resume<CR>


autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
    nnoremap <silent><buffer><expr> <CR>
        \ denite#do_map('do_action')
    nnoremap <silent><buffer><expr> a
        \ denite#do_map('choose_action')
    nnoremap <silent><buffer><expr> d
        \ denite#do_map('do_action', 'delete')
    nnoremap <silent><buffer><expr> p
        \ denite#do_map('do_action', 'preview')
    nnoremap <silent><buffer><expr> q
        \ denite#do_map('quit')
    nnoremap <silent><buffer><expr> '
        \ denite#do_map('quick_move')
    nnoremap <silent><buffer><expr> i
        \ denite#do_map('open_filter_buffer')
    nnoremap <silent><buffer><expr> <Space>
        \ denite#do_map('toggle_select').'j'
    nnoremap <silent><buffer><expr> r
        \ denite#do_map('do_action', 'quickfix')
    nnoremap <silent><buffer><expr> <C-r>
        \ denite#do_map('restore_sources')
endfunction

call denite#custom#var('grep', 'command', ['ag'])
call denite#custom#var('grep', 'default_opts',
        \ ['-i', '--vimgrep'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', [])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

call denite#custom#var('file/rec', 'command',
        \ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])

call denite#custom#filter('matcher/ignore_globs', 'ignore_globs',
        \ [ '.git/', '.ropeproject/', '__pycache__/',
        \   'venv/', 'images/', '*.min.*', 'img/', 'fonts/'])

let s:menus = {}
let s:menus.neomru = {
        \ 'description': 'Neomru'
        \ }
let s:menus.neomru.file_candidates = [
        \ ['Edit mru file', '~/.cache/neomru/file'],
        \ ['Edit mru directory', '~/.cache/neomru/directory']
        \ ]

let s:menus.vimrc = {
        \ 'description': 'vimrc'
        \ }
let s:menus.vimrc.file_candidates = [
        \ ['Edit init.vim', '~/nvimfiles/init.vim'],
        \ ['Edit ginit.vim', '~/nvimfiles/ginit.vim'],
        \ ['Edit dein.rc.vim', '~/nvimfiles/dein.rc.vim'],
        \ ['Edit dein.toml', '~/nvimfiles/dein_lazy.toml'],
        \ ['Edit dein_lazy.toml', '~/nvimfiles/dein_lazy.toml']
        \ ]

call denite#custom#var('menu', 'menus', s:menus)
