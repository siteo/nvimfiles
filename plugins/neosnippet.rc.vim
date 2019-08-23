let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory = '~/.nvim/dein/repos/github.com/honza/vim-snippets/snippets'

if has('conceal')
    set conceallevel=2 concealcursor=niv
endif

imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)
