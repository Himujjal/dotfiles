" Configuration for vim-markdown
let g:vim_markdown_conceal = 2
let g:vim_markdown_conceal_code_blocks = 0
let g:vim_markdown_math = 1
let g:vim_markdown_toml_frontmatter = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_strikethrough = 1
let g:vim_markdown_autowrite = 1
let g:vim_markdown_edit_url_in = 'vplit'
let g:vim_markdown_follow_anchor = 1
let g:vim_markdown_folding_level = 6
" let g:vim_markdown_fenced_languages = [
"     \'rust=rs',
"     \'javascript=js',
"     \'js=js',
"     \'java=java',
"     \'viml=vim',
"     \'bash=sh',
"     \'typescript=ts',
"     \'typescriptreact=tsx',
"     \'svelte=svelte',
"     \'python=py',
"     \'css=css',
"     \'html=html'
"     \]

au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
