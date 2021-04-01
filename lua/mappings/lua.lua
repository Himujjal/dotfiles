local function map(mode, lhs, rhs, opts)
    local options = {noremap = true}
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- keybind list
-- map("", "<leader>c", '"+y')


-- map navigation between splits using <C-{h,j,k,l}>
map("n", "<C-k>", [[<Cmd> wincmd k<CR>]])
map("n", "<C-l>", [[<Cmd> wincmd l<CR>]])
map("n", "<C-h>", [[<Cmd> wincmd h<CR>]])
map("n", "<C-j>", [[<Cmd> wincmd j<CR>]])

-- horizontal & vertical resize
map("n", "+", [[<Cmd> vertical resize +5<CR>]])
map("n", "_", [[<Cmd> vertical resize -5<CR>]])
map("n", "<leader>=", [[<Cmd> resize +5<CR>]])
map("n", "<leader>-", [[<Cmd> resize -5<CR>]])

-- tab navigation
map("n", "<leader>k", [[<Cmd> lua BufferLineCycleNext<CR>]])
map("n", "<leader>j", [[<Cmd> BufferLineCyclePrev<CR>]])
map("n", "<leader><S-K>", [[<Cmd> BufferLineMoveNext<CR> ]])
map("n", "<leader><S-J>", [[<Cmd> BufferLineMovePrev<CR> ]])

-- save
map("n", "zz", [[<Cmd> w<CR>]], { silent = true })

-- remove selection
map("n", "<leader><Esc>", [[<Cmd> noh <CR>]], { silent = true })

-- search for selected item
--      - select item in visual mode
--      - press '//' to search for the item
map('v', "//", [[ y/\V<C-R>=escape(@", '/\')<CR><CR> ]], { silent = true})


-- TOGGLE conceallevel
function toggle_conceal()
  local conceallevel = vim.api.nvim_win_get_option(0, "conceallevel") 
  if (conceallevel == 2) then 
    vim.api.nvim_win_set_option(0, 'conceallevel', 0)
  else
    vim.api.nvim_win_set_option(0, 'conceallevel', 2)
  end
end
map("n", "<leader><C-l>", [[ <Cmd>lua toggle_conceal()<CR> ]], {
  silent = true,
  noremap = true
});


function toggle_wrap()
  local iswrap = vim.api.nvim_win_get_option(0, 'wrap')
  if (iswrap == true) then
    vim.api.nvim_win_set_option(0, 'wrap', false)
  else
    vim.api.nvim_win_set_option(0, 'wrap', true)
  end
end

map("n", "<leader><C-w>", [[ <Cmd>lua toggle_wrap()<CR> ]], {
  silent = true,
  noremap = true
});

-- open terminals  
-- insert mode for terminals
-- vim.api.nvim_command([[au BufEnter * if &buftype == 'terminal' | :startinsert | endif]])

-- map("n", "<C-x>" , [[<Cmd> vnew term://$SHELL<CR>]] , opt) -- split term vertically , over the right  
-- map("n", "<C-b>" , [[<Cmd> split term://$SHELL | resize 10 <CR>]] , opt) -- split term vertically , over the right  
map("t", "<Esc>", [[<C-\><C-n>]]) -- return to normal mode in terminal


