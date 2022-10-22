require("formatter").setup({
	filetype = {
		lua = { require("formatter.filetypes.lua").stylua },
		json = {
			require("formatter.filetypes.javascript").prettiereslint,
		},
		javascript = {
			require("formatter.filetypes.javascript").prettiereslint,
			-- require("formatter.filetypes.javascript").prettier,
		},
		javascriptreact = {
			-- require("formatter.filetypes.javascriptreact").prettiereslint,
			require("formatter.filetypes.javascriptreact").prettier,
		},
		typescript = {
			-- require("formatter.filetypes.typescript").prettiereslint,
			require("formatter.filetypes.typescript").prettier,
		},
		typescriptreact = {
			-- require("formatter.filetypes.typescriptreact").prettiereslint,
			require("formatter.filetypes.typescriptreact").prettier,
		},
		svelte = {
			require("formatter.filetypes.svelte").prettier
		},
		go = {
			require("formatter.filetypes.go").gofmt
		},
		rust = {
			require("formatter.filetypes.rust").rustfmt
		},
		zig = {
			require('formatter.filetypes.zig').zigfmt
		}
	},
})
