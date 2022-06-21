vim.cmd([[packadd nvim-tree.lua]])

vim.api.nvim_set_keymap("n", "<C-n>", ":NvimTreeToggle<CR>", {
	noremap = true,
	silent = true,
})

local list = {
	{ key = { "<CR>", "o", "<2-LeftMouse>" }, action = "edit" },
	{ key = { "<2-RightMouse>", "<C-]>" }, action = "cd" },
	{ key = "s", action = "vsplit" },
	{ key = "i", action = "split" },
	{ key = "<C-t>", action = "tabnew" },
	{ key = "<", action = "prev_sibling" },
	{ key = ">", action = "next_sibling" },
	{ key = "P", action = "parent_node" },
	{ key = "<BS>", action = "close_node" },
	{ key = "<S-CR>", action = "close_node" },
	{ key = "<Tab>", action = "preview" },
	{ key = "K", action = "first_sibling" },
	{ key = "J", action = "last_sibling" },
	{ key = "I", action = "toggle_git_ignored" },
	{ key = "H", action = "toggle_dotfiles" },
	{ key = "R", action = "refresh" },
	{ key = "a", action = "create" },
	{ key = "d", action = "remove" },
	{ key = "r", action = "rename" },
	{ key = "<C-r>", action = "full_rename" },
	{ key = "x", action = "cut" },
	{ key = "c", action = "copy" },
	{ key = "p", action = "paste" },
	{ key = "y", action = "copy_name" },
	{ key = "Y", action = "copy_path" },
	{ key = "gy", action = "copy_absolute_path" },
	{ key = "[c", action = "prev_git_item" },
	{ key = "]c", action = "next_git_item" },
	{ key = "-", action = "dir_up" },
	{ key = "q", action = "close" },
	{ key = "g?", action = "toggle_help" },
}

require("nvim-tree").setup({
	view = {
		width = 24,
		side = "left",
		mappings = {
			list = list,
		},
	},
	renderer = {
		highlight_git = true,
		group_empty = true,
		full_name = true,
		highlight_opened_files = "icon",
		icons = {
			glyphs = {
				default = " ",
				symlink = " ",
				git = {
					unstaged = "✗",
					staged = "✓",
					unmerged = "",
					renamed = "➜",
					untracked = "★",
				},

				folder = {
					default = "",
					open = "",
					symlink = "",
				},
			},
		},
	},
	filters = {
		dotfiles = false,
		custom = { ".git", "node_modules", ".cache" },
	},
	update_focused_file = {
		enable = false,
		ignore_list = { ".git", "node_modules", ".cache" },
	},
	filesystem_watchers = {
		enable = true,
		interval = 100,
	},
})
