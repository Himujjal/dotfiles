local ts_config = require("nvim-treesitter.configs")

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

-- parser_config.svelte = {
--   install_info = {
--     url = "/Users/himujjalupadhyaya/projects/oss/tree-sitter-svelte",
--     files = {"src/parser.c", "src/scanner.c"}
--   },
--   filetype = "svelte"
-- }

parser_config.v = {
	install_info = {
		url = "https://github.com/nedpals/tree-sitter-v",
		files = { "src/parser.c", "src/scanner.c" }
	},
	filetype = "vlang"
}

parser_config.wgsl = {
	install_info = {
		url = "https://github.com/szebniok/tree-sitter-wgsl",
		files = { "src/parser.c" },
	},
	filetype = "wgsl",
}

ts_config.setup({
	ensure_installed = {
        "wgsl",
		"javascript",
		"typescript",
		"html",
		"css",
		"bash",
		"cpp",
		"rust",
		"lua",
		"svelte",
		"zig",
		"c",
		"cpp",
		"json",
		"jsdoc",
		"toml",
		"python",
	},
	highlight = {
		enable = true,
		use_languagetree = true,
	},
	indent = {
		enable = true,
	},
	query_linter = {
		enable = true,
		use_virtual_text = true,
		-- lint_events = { "BufWrite", "CursorHold"}
	},
})

vim.api.nvim_command("set foldmethod=expr")
vim.api.nvim_command("set foldexpr=nvim_treesitter#foldexpr()")
