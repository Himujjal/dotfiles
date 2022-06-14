vim.cmd [[packadd markdown-preview.nvim]]

vim.g.mkdp_echo_preview_url = 1

-- -- mappings
vim.api.nvim_set_keymap("n", "<leader><C-p>", "<Cmd> MarkdownPreviewToggle<CR>", {})
