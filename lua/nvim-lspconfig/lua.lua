local cmd = vim.cmd
local vim_api = vim.api
local keymap_set = vim.keymap.set
local lsp_buf = vim.lsp.buf
local diagnostic = vim.diagnostic
local inspect = vim.inspect
local protocol = vim.lsp.protocol
local fn = vim.fn

cmd([[packadd nvim-lspconfig]])
cmd([[packadd nvim-compe]])

local lspconfig = require("lspconfig")

local on_attach = function(client, bufnr)
	if client.config.flags then
		client.config.flags.allow_incremental_sync = true
	end

	vim_api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Mappings.
	local opts = { noremap = true, silent = true }

	keymap_set("n", "gD", lsp_buf.declaration, opts)
	keymap_set("n", "gd", lsp_buf.definition, opts)
	keymap_set("n", "<leader>ca", lsp_buf.code_action, opts)
	keymap_set("n", "<S-K>", lsp_buf.hover, opts)
	keymap_set("n", "gi", lsp_buf.implementation, opts)
	keymap_set("n", "<leader><C-k>", lsp_buf.signature_help, opts)
	keymap_set("n", "<leader>wa", lsp_buf.add_workspace_folder, opts)
	keymap_set("n", "<leader>wr", lsp_buf.remove_workspace_folder, opts)
	keymap_set("n", "<leader>wl", function()
		print(inspect(lsp_buf.list_workspace_folders))
	end, opts)
	keymap_set("n", "<leader>D", lsp_buf.type_definition, opts)
	keymap_set("n", "<leader>rn", lsp_buf.rename, opts)
	keymap_set("n", "gr", lsp_buf.references, opts)
	keymap_set("n", "<leader>e", diagnostic.open_float, opts)
	keymap_set("n", "<leader>[", diagnostic.goto_prev, opts)
	keymap_set("n", "<leader>]", diagnostic.goto_next, opts)
	keymap_set("n", "<leader>q", diagnostic.setloclist, opts)
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
	-- "sumneko_lua",
	"kotlin_language_server",
	-- "jsonnet_ls",
	"nimls",
	"ocamllsp",
}

lspconfig.zls.setup({
	log_level = protocol.MessageType.Log,
	-- message_level = vim.lsp.protocol.MessageType.Log,
})

lspconfig.vls.setup({})

local function eslint_config_exists()
	local eslintrc = fn.glob(".eslintrc*", 0, 1)
	if not vim.tbl_isempty(eslintrc) then
		return true
	end
	if fn.filereadable("package.json") == 1 then
		if fn.json_decode(fn.readfile("package.json"))["eslintConfig"] == 1 then
			return true
		end
	end
	return false
end

if eslint_config_exists() == true then
	lspconfig.eslint.setup({})
end

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

lspconfig.sumneko_lua.setup({
	on_attach = on_attach,
	settings = { Lua = { diagnostics = { globals = { "vim" } } } },
})

--Enable (broadcasting) snippet capability for completion
local htmlCapabilities = vim.lsp.protocol.make_client_capabilities()
htmlCapabilities.textDocument.completion.completionItem.snippetSupport = true
lspconfig.html.setup({
	capabilities = htmlCapabilities,
})
