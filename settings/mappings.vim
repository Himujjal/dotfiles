nnoremap <silent> <leader>+ :vertical resize +5<CR>
nnoremap <silent> <leader>- :vertical resize -5<CR>
nnoremap <silent> <leader>rp :resize 100<CR>

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
vnoremap X "_d

" search for visually selected text 
vnoremap // y/\V<C-R>=escape(@", '/\')<CR><CR>


" Disable the arrow keys
noremap <Up> <Nop>
noremap <Right> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>

" Tab navigation like Firefox.
nnoremap <silent> <leader>H :tabprevious<CR>
nnoremap <silent> <leader>L :tabnext<CR>
nnoremap <C-t>     :tabnew<CR>

" Vim Splits
nnoremap <C-j> <C-W><C-J>
nnoremap <C-k> <C-W><C-K>
nnoremap <C-l> <C-W><C-L>
nnoremap <C-h> <C-W><C-H>

" Create new line without leaving normal mode
nnoremap <leader>j o<Esc>k
nnoremap <leader>k O<Esc>j
" nnoremap <silent> zj o<Esc>k
" nnoremap <silent> zk O<Esc>j

" Clear selection on Enter
nnoremap <cr> :noh<CR><CR>:<backspace>

" nnoremap <leader>n :set number!<cr>
nnoremap <leader>n :set relativenumber!<cr>
" nnoremap <leader>r :e!<cr>

" Toggle Terminal
let g:term_buf = 0
let g:term_win = 0
function! Term_toggle(height)
    if win_gotoid(g:term_win)
        hide
    else
        botright new
        exec "resize " . a:height
        try
            exec "buffer " . g:term_buf
        catch
            call termopen($SHELL, {"detach": 0})
            let g:term_buf = bufnr("")
        endtry
        startinsert!
        let g:term_win = win_getid()
    endif
endfunction

au BufEnter * if &buftype == 'terminal' | :startinsert | endif

nnoremap <C-q> :tabnew +terminal<cr>

" zz to save a file
nnoremap <silent> zz :w<CR>


" --- Split panes to right and below ---
set splitright
set splitbelow
" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>
" start terminal in insert mode

" " open terminal on ctrl+n
" function! OpenTerminal()
"     split +term
"     resize 10
" endfunction
nnoremap <c-b> :call Term_toggle(10)<CR>

"Toggle Full Screen (NVIM QT)
if g:is_win
    noremap <silent><F11> :call rpcnotify(0, 'Gui', 'WindowFullScreen', !g:GuiWindowFullScreen)<CR>
endif

" CocShortcuts
nnoremap <leader>r :CocRestart<cr><cr>

