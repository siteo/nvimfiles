nnoremap [ALE] <Nop>
nmap <Space>a [ALE]
nnoremap <silent> [ALE]f :<C-u>ALEFix<CR>
nnoremap <silent> [ALE]d :<C-u>ALEDetail<CR>
nnoremap <silent> [ALE]n :<C-u>ALENext<CR>
nnoremap <silent> [ALE]p :<C-u>ALEPrevious<CR>

let g:ale_linter_aliases = {
    \ 'javascriptreact': ['javascript', 'jsx'],
    \ 'typescriptreact': ['typescript', 'tsx'],
    \ }

let g:ale_linters = {
    \ 'python': ['flake8'],
    \ 'javascript': ['eslint', 'tsserver'],
    \ 'typescript': ['eslint', 'tsserver'],
    \ 'css': ['stylelint'],
    \ 'scss': ['stylelint'],
    \ }

let g:ale_fixers = {
    \ 'python': ['autopep8', 'black', 'isort'],
    \ 'javascript': ['prettier'],
    \ 'json': ['prettier'],
    \ 'css': ['prettier'],
    \ 'scss': ['prettier'],
    \ 'html': ['prettier'],
    \ }

if has('mac')
    let g:ale_python_flake8_executable = expand('~/.nvim/pynvim/bin/flake8')
    let g:ale_python_autopep8_executable = expand('~/.nvim/pynvim/bin/autopep8')
    let g:ale_python_isort_executable = expand('~/.nvim/pynvim/bin/isort')
    let g:ale_python_black_executable = expand('~/..nvim/pynvim/bin/black')
elseif has('win32') || has('win64')
    let g:ale_python_flake8_executable = $HOMEPATH.'\nvimenv\pynvim\Scripts\python'
    let g:ale_python_autopep8_executable = $HOMEPATH.'\nvimenv\pynvim\Scripts\python'
    let g:ale_python_isort_executable = $HOMEPATH.'\nvimenv\pynvim\Scripts\python'
    let g:ale_python_black_executable = $HOMEPATH.'\nvimenv\pynvim\Scripts\python'
endif

let g:ale_python_flake8_options = '-m flake8 --ignore=E501'
let g:ale_python_autopep8_options = '-m autopep8'
let g:ale_python_isort_options = '-m isort'
let g:ale_python_black_options = '-m black'

let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 0
