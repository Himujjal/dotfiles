-- vim.cmd [[packadd nvim-toggleterm.lua]]

require("toggleterm").setup({
  size = 10,
  open_mapping = "<C-x>",
  -- shade_filetypes = {},
  -- shade_terminals = true,
  -- shading_factor = ,
  start_in_insert = true,
  persist_size = true,
  direction = 'horizontal'
})
