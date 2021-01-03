" Configuration for vim-markdown
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0
let g:vim_markdown_math = 1
let g:vim_markdown_toml_frontmatter = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_strikethrough = 1
let g:vim_markdown_autowrite = 1
let g:vim_markdown_edit_url_in = 'vplit'
let g:vim_markdown_follow_anchor = 1
let g:vim_markdown_folding_level = 4
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

nmap <leader><C-p> <Plug>MarkdownPreview
au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown

" Markdown Preview
let g:mkdp_echo_preview_url = 1

" ========== HTML bracey - live reload ===========

let g:isBraceyOn=0
function ToggleBracey()
    if g:isBraceyOn == 1
        let g:isBraceyOn = 0
        BraceyStop
    else
        let g:isBraceyOn = 1
        Bracey
    endif
endfunction

nnoremap <leader><C-o> :call ToggleBracey()<CR>

