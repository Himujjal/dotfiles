local scopes = {o = vim.o, b = vim.bo, w = vim.wo}

local function opt(scope, key, value)
    scopes[scope][key] = value
    if scope ~= "o" then
        scopes["o"][key] = value
    end
end

opt("o", "hidden", true)
opt("o", "ignorecase", true)
opt("o", "splitbelow", true)
opt("o", "splitright", true)
opt("o", "termguicolors", true)


opt("o", "mouse", "a")

opt("w", "signcolumn", "yes")
opt("o", "cmdheight", 1)

opt("o", "updatetime", 250) -- update interval for gitsigns 
opt("o", "clipboard", "unnamedplus")

-- for indentline
opt("b", "expandtab", true )

opt("b", "shiftwidth", 4 )
opt("b", "tabstop", 4 )

vim.cmd("autocmd BufNewFile,BufRead *.js,*.jsx set shiftwidth=4")
vim.cmd("autocmd BufNewFile,BufRead *.ts,*.tsx,*.svelte,*.html set shiftwidth=2")
vim.cmd("autocmd BufWinEnter *.* set number")
vim.cmd("autocmd BufWinEnter *.* set relativenumber")

local M = {}

function M.is_buffer_empty()
    -- Check whether the current buffer is empty
    return vim.fn.empty(vim.fn.expand("%:t")) == 1
end

function M.has_width_gt(cols)
    -- Check if the windows width is greater than a given number of columns
    return vim.fn.winwidth(0) / 2 > cols
end

return M
