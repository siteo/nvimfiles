nnoremap [jedi] <Nop>
nmap <Space>j [jedi]

let g:jedi#goto_command = "[jedi]d"
let g:jedi#goto_assignments_command = "[jedi]g"
let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = "[jedi]k"
let g:jedi#usages_command = "[jedi]n"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "[jedi]r"
