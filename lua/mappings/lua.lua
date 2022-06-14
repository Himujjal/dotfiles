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
map("n", "<leader>k", [[<Cmd> BufferLineCycleNext<CR>]])
map("n", "<leader>j", [[<Cmd> BufferLineCyclePrev<CR>]])
map("n", "<leader><S-K>", [[<Cmd> BufferLineMoveNext<CR> ]])
map("n", "<leader><S-J>", [[<Cmd> BufferLineMovePrev<CR> ]])
map("n", "<leader>bl", [[<Cmd>BufferLinePick<CR>]])
map("n", "<leader>bcr", [[<Cmd>BufferLineCloseRight<CR>]])
map("n", "<leader>bcl", [[<Cmd>BufferLineCloseLeft<CR>]])
map("n", "<C-w>", "<Cmd>bwipe<CR>", { silent = true })

-- save
map("n", "zz", [[<Cmd> w<CR>]], { silent = true })

-- remove selection
map("n", "<leader><Esc>", [[<Cmd> noh <CR>]], { silent = true })

-- search for selected item
--      - select item in visual mode
--      - press '//' to search for the item
map('v', "/", [[y/\V<C-R>=escape(@",'/\')<CR><CR>]], { silent = true})


-- TOGGLE conceallevel
function toggle_conceal()
  local conceallevel = vim.api.nvim_win_get_option(0, "conceallevel") 
  if (conceallevel == 2) then 
    vim.api.nvim_win_set_option(0, 'conceallevel', 0)
  else
    vim.api.nvim_win_set_option(0, 'conceallevel', 3)
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

map("n", "<leader>lg", [[ <Cmd>LazyGit<CR>]], { silent = true })

-- return normal mode on esc in terminal
map("t", "<Esc>", [[<C-\><C-n>]], { silent = true })

-- Restart LSP
map("n", "<leader>lr", [[:LspRestart<CR>]], { silent = false })

