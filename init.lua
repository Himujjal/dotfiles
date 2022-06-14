-- load plugins

require("pluginsList.lua")
require("web-devicons.lua")

require("kommentary.lua")
require("close_tags.lua")
require("utils.lua")
require("nvimTree.lua")
require("bufferline.lua")
require("statusline.lua")
require("telescope-nvim.lua")
require("markdown-preview.lua")
require('nvim-dap.lua')

-- lsp
require("nvim-lspconfig.lua")
require("nvim-compe.lua")
require('snips.lua')


-- gi
require("gitsigns.lua")
require("nvim-toggleterm.lua")
require "colorizer".setup()

local cmd = vim.cmd
local g = vim.g
local indent = 4

cmd "set nofixendofline"

cmd "colorscheme base16-onedark"
cmd "syntax enable"
cmd "syntax on"

-- no wrap on all windows
cmd "autocmd WinEnter * set nowrap"

-- g.auto_save = 1
-- g.indentLine_char_list = {'▏'}
g.mapleader = " "

-- Set bash as the default shell
cmd([[set shell=/bin/bash]])


require("treesitter.lua")
require("mappings.lua")

-- highlights
cmd("hi LineNr guibg=NONE")
cmd("hi SignColumn guibg=NONE")
cmd("hi VertSplit guibg=NONE")
cmd("hi DiffAdd guifg=#81A1C1 guibg = none")
cmd("hi DiffChange guifg =#3A3E44 guibg = none")
cmd("hi DiffModified guifg = #81A1C1 guibg = none")
cmd("hi EndOfBuffer guifg=#282c34")

cmd("hi TelescopeBorder   guifg=#3e4451")
cmd("hi TelescopePromptBorder   guifg=#3e4451")
cmd("hi TelescopeResultsBorder  guifg=#3e4451")
cmd("hi TelescopePreviewBorder  guifg=#525865")
cmd("hi PmenuSel  guibg=#98c379")

-- tree folder name , icon color
cmd("hi NvimTreeFolderIcon guifg = #61afef")
cmd("hi NvimTreeFolderName guifg = #61afef")
cmd("hi NvimTreeIndentMarker guifg=#545862")

require("nvim-autopairs").setup{}
-- require("lspkind").init({ File = " " })



vim.cmd("autocmd BufRead,BufNewFile *.postcss set filetype=css")
vim.cmd("autocmd BufRead,BufNewFile *.zig set filetype=zig")
vim.cmd("autocmd BufRead,BufNewFile *.hbs,*.handlebars set filetype=svelte")
vim.cmd("autocmd BufRead,BufNewFile *.graphql,*.gql,*.graphqls set filetype=graphql")
vim.cmd("autocmd BufRead,BufNewFile *.ek set syntax=typescript")
vim.cmd("autocmd BufRead,BufNewFile *.fish set syntax=bash")
vim.cmd("autocmd BufRead,BufNewFile *.scm set syntax=lisp")

-- GUI Settings
vim.opt.guifont = "FiraCode Nerd Font:h9"
-- vim.g.neovide_refresh_rate = 140
-- vim.g.neovide_transparency='0.8'
vim.api.nvim_set_var('neovide_refresh_rate', 140)
-- vim.api.nvim_set_var("neovide_transparency",  0.8)
vim.api.nvim_set_var("neovide_cursor_vfx_mode",  'sonicboom')

vim.cmd("inoremap <silent><expr> <CR> compe#confirm('<CR>')")
