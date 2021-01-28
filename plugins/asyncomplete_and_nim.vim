" Brackets
" inoremap { {<CR>}<Esc>ko<Tab><Esc>i
" inoremap ( ()<Esc>ha
" inoremap [ []<Esc>ha
" inoremap < <><Esc>ha
" inoremap " ""<Esc>ha
" inoremap ' ''<Esc>ha
" inoremap ` ``<Esc>ha
" inoremap ` ``<Esc>ha

" Nim settings
" au User asyncomplete_setup call asyncomplete#register_source({
"             \ 'name': 'nim',
"             \ 'whitelist': ['nim'],
"             \ 'completor': {opt, ctx -> nim#suggest#sug#GetAllCandidates({start, candidates -> asyncomplete#complete(opt['name'], ctx, start, candidates)})}
"             \ })
