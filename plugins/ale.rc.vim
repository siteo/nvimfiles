nnoremap [ale] <Nop>
nmap <Space>a [ale]
nnoremap <silent> [ale]f :<C-u>ALEFix<CR>

let g:ale_linters = {
    \ 'python': ['flake8'],
    \ }

let g:ale_fixers = {
    \ 'python': ['autopep8', 'black', 'isort'],
    \ }

let g:ale_python_flake8_executable = '/usr/local/var/pyenv/versions/py3neovim/bin/python'
let g:ale_python_flake8_options = '-m flake8'
let g:ale_python_autopep8_executable = '/usr/local/var/pyenv/versions/py3neovim/bin/python'
let g:ale_python_autopep8_options = '-m autopep8'
let g:ale_python_isort_executable = '/usr/local/var/pyenv/versions/py3neovim/bin/python'
let g:ale_python_isort_options = '-m isort'
let g:ale_python_black_executable = '/usr/local/var/pyenv/versions/py3neovim/bin/python'
let g:ale_python_black_options = '-m black'
