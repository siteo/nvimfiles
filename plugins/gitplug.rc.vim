nnoremap [GitPlug] <Nop>
nmap <Space>g [GitPlug]

" fugitive
nnoremap <silent> [GitPlug]s :<C-u>Gstatus<CR>
nnoremap <silent> [GitPlug]w :<C-u>Gwrite<CR>
nnoremap <silent> [GitPlug]c :<C-u>Gcommit<CR>
nnoremap <silent> [GitPlug]r :<C-u>Gread<CR>
nnoremap <silent> [GitPlug]d :<C-u>Gdiff<CR>
nnoremap <silent> [GitPlug]b :<C-u>Gblame<CR>
nnoremap <silent> [GitPlug]i :<C-u>Git init<CR>

" gitgutter
nnoremap <silent> [GitPlug]n :<C-u>GitGutterNextHunk<CR>
nnoremap <silent> [GitPlug]p :<C-u>GitGutterPrevHunk<CR>
nnoremap <silent> [GitPlug]g :<C-u>GitGutter<CR>
nnoremap <silent> [GitPlug]a :<C-u>GitGutterAll<CR>
