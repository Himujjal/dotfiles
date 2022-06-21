vim.cmd([[packadd nvim-lspconfig]])
vim.cmd([[packadd nvim-compe]])

local lspconfig = require("lspconfig")

local on_attach = function(client, bufnr)
	if client.config.flags then
		client.config.flags.allow_incremental_sync = true
	end

	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end

	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end

	buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Mappings.
	local opts = { noremap = true, silent = true }

	-- vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)

	buf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
	buf_set_keymap("n", "<leader>ca", "<Cmd>lua vim.lsp.buf.code_action()<CR>", opts)
	buf_set_keymap("n", "<S-K>", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
	buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	buf_set_keymap("n", "<leader><C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	buf_set_keymap("n", "<leader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
	buf_set_keymap("n", "<leader>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
	buf_set_keymap("n", "<leader>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
	buf_set_keymap("n", "<leader>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
	buf_set_keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	buf_set_keymap("n", "<leader>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
	buf_set_keymap("n", "<leader>[", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
	buf_set_keymap("n", "<leader>]", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
	buf_set_keymap("n", "<leader>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)

	-- Set some keybinds conditional on server capabilities
	if client.resolved_capabilities.document_formatting then
		buf_set_keymap("n", "<leader>fm", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
	elseif client.resolved_capabilities.document_range_formatting then
		buf_set_keymap("n", "<leader>fi", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
	end
end

local servers = {
	"tsserver",
	"cssls",
	"gopls",
	"zls",
	"pyright",
	"svelte",
	"clangd",
	"dartls",
    "sumneko_lua",
	-- "jsonnet_ls",
	"nimls",
	"ocamllsp",
}

local function eslint_config_exists()
	local eslintrc = vim.fn.glob(".eslintrc*", 0, 1)
	if not vim.tbl_isempty(eslintrc) then
		return true
	end
	if vim.fn.filereadable("package.json") then
		if vim.fn.json_decode(vim.fn.readfile("package.json"))["eslintConfig"] then
			return true
		end
	end
	return false
end

local eslint = {
	lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}",
	lintStdin = true,
	lintFormats = { "%f:%l:%c: %m" },
	lintIgnoreExitCode = true,
	formatCommand = "eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}",
	formatStdin = true,
}

for _, lsp in ipairs(servers) do
	if lsp == "tsserver" then
		lspconfig["tsserver"].setup({
			on_attach = on_attach,
			root_dir = vim.loop.cwd,
		})
	else
		lspconfig[lsp].setup({ on_attach = on_attach })
	end
	-- print(lsp)
end

-- For lsp supporting snippets

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
	properties = { "documentation", "detail", "additionalTextEdits" },
}

lspconfig.rust_analyzer.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

--Enable (broadcasting) snippet capability for completion
local htmlCapabilities = vim.lsp.protocol.make_client_capabilities()
htmlCapabilities.textDocument.completion.completionItem.snippetSupport = true
lspconfig.html.setup({
	capabilities = htmlCapabilities,
})
