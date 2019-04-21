nnoremap [denite] <Nop>
nmap <Space>f [denite]

nnoremap <silent> [denite]f :<C-u>Denite file<CR>
nnoremap <silent> [denite]n :<C-u>Denite file:new<CR>
nnoremap <silent> [denite]r :<C-u>Denite file/rec<CR>
nnoremap <silent> [denite]m :<C-u>Denite file_mru<CR>
nnoremap <silent> [denite]b :<C-u>Denite buffer<CR>
nnoremap <silent> [denite]c :<C-u>Denite change<CR>
nnoremap <silent> [denite]l :<C-u>Denite line<CR>
nnoremap <silent> [denite]t :<C-u>Denite tag<CR>
nnoremap <silent> [denite]e :<C-u>Denite menu<CR>
nnoremap <silent> [denite]g :<C-u>Denite grep<CR>

call denite#custom#var('file/rec', 'command',
    \ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])

let s:menus = {}

let s:menus.nvimfiles = {'description': 'Edit your neovim configuration'}
let s:menus.nvimfiles.file_candidates = [
    \ ['init.vim', '~/nvimfiles/init.vim'],
    \ ['ginit.vim', '~/nvimfiles/ginit.vim'],
    \ ['dein.toml', '~/nvimfiles/dein.toml'],
    \ ['dein_lazy.toml', '~/nvimfiles/dein_lazy.toml'],
    \ ]

call denite#custom#var('menu', 'menus', s:menus)
