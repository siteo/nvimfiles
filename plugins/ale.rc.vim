nnoremap [ALE] <Nop>
nmap <Space>a [ALE]
nnoremap <silent> [ALE]f :<C-u>ALEFix<CR>
nnoremap <silent> [ALE]d :<C-u>ALEDetail<CR>
nnoremap <silent> [ALE]n :<C-u>ALENext<CR>
nnoremap <silent> [ALE]p :<C-u>ALEPrevious<CR>

let g:ale_linters = {
    \ 'python': ['flake8'],
    \ 'javascript': ['eslint'],
    \ 'vue': ['eslint'],
    \ 'css': ['stylelint'],
    \ 'scss': ['stylelint'],
    \ }

let g:ale_fixers = {
    \ 'python': ['autopep8', 'black', 'isort'],
    \ 'javascript': ['prettier'],
    \ 'json': ['prettier'],
    \ 'vue' : ['prettier'],
    \ 'css': ['stylelint'],
    \ 'scss': ['stylelint'],
    \ }

if has('mac')
    let g:ale_python_flake8_executable = '/usr/local/var/pyenv/versions/py3neovim/bin/python'
    let g:ale_python_autopep8_executable = '/usr/local/var/pyenv/versions/py3neovim/bin/python'
    let g:ale_python_isort_executable = '/usr/local/var/pyenv/versions/py3neovim/bin/python'
    let g:ale_python_black_executable = '/usr/local/var/pyenv/versions/py3neovim/bin/python'
elseif has('win32') || win('win64')
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
