vim.cmd [[packadd nvim-lspconfig]]
vim.cmd [[packadd nvim-compe]]

vim.o.completeopt = "menuone,noselect"

require"compe".setup {
  enabled = true,
  autocomplete = true,
  debug = false,
  min_length = 1,
  preselect = "enable",
  throttle_time = 80,
  source_timeout = 200,
  incomplete_delay = 400,
  max_abbr_width = 100,
  max_kind_width = 100,
  max_menu_width = 100,
  documentation = false,
  source = {
    path = true,
    buffer = true,
    calc = true,
    --vsnip = true,
    nvim_lsp = true,
    nvim_lua = true,
    spell = true,
    tags = true,
    snippets_nvim = true,
    treesitter = true
  }
}

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t"<C-n>"
  else
    return t"<Tab>"
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  else
    return t "<S-Tab>"
  end
end

--  mappings
--
--00000
vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
-- vim.api.nvim_set_keymap("i", "<CR>", ":compe#confirm('<CR>')", { expr = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-f>", ":compe#scroll({'delta': +4})", { expr = true })
vim.api.nvim_set_keymap("i", "<C-d>", ":compe#scroll({'delta': -4})", { expr = true })
-- vim.api.nvim_set_keymap('i', '<CR>', [[compe#confirm('<CR>')]], {silent = true, expr = true})
-- vim.api.nvim_set_keymap("i", "<CR>", "compe#complete()", { expr = true })

function _G.completions()
  local npairs = require("nvim-autopairs")
  if vim.fn.pumvisible() == 1 then
    if vim.fn.complete_info()["selected"] ~= -1 then
      return vim.fn["compe#confirm"]("<CR>")
    end
  end
  return npairs.check_break_line_char()
end

vim.cmd("inoremap <silent><expr> <CR> compe#confirm('<CR>')")

