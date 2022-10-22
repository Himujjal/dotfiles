-- check if packer is installed (~/local/share/nvim/site/pack)
local packer_exists = pcall(vim.cmd, [[packadd packer.nvim]])

return require("packer").startup(function()
	use({ "wbthomason/packer.nvim", opt = true })
	use({ "kyazdani42/nvim-web-devicons" })
	use({ "kyazdani42/nvim-tree.lua" })
	use({ "nvim-lua/plenary.nvim" })
	use({ "lewis6991/gitsigns.nvim" })
	use({ "glepnir/galaxyline.nvim" })
	use({ "akinsho/bufferline.nvim", tag = "v3.*", requires = "kyazdani42/nvim-web-devicons" })
	-- use({ "akinsho/bufferline.lua" })
	use({ "akinsho/toggleterm.nvim", tag = "*" })
	use({ "norcalli/snippets.nvim" })
	use({ "nvim-treesitter/nvim-treesitter" })
	use({ "f-person/git-blame.nvim" })
	use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })
	-- use {'digitalload/vim-pug'}
	-- use {'nvim-treesitter/playground'}
	use({ "chriskempson/base16-vim" })
	use({ "norcalli/nvim-colorizer.lua" })
	-- use {'Yggdroot/indentLine'}
	-- use {"ryanoasis/vim-devicons"}
	use({ "sbdchd/neoformat" })
	use({ "mhartington/formatter.nvim" })
	use({ "neovim/nvim-lspconfig" })
	use({ "hrsh7th/nvim-compe" })
	use({ "windwp/nvim-autopairs" })
	use({ "alvan/vim-closetag" })
	-- use {"tweekmonster/startuptime.vim"}
	use({ "onsails/lspkind-nvim" })
	use({ "nvim-lua/popup.nvim" })
	use({ "nvim-telescope/telescope.nvim" })
	use({ "nvim-telescope/telescope-media-files.nvim" })
	use({ "b3nj5m1n/kommentary" })
	use({ "zah/nim.vim" })
	use({ "kdheepak/lazygit.nvim" })

	use({ "ollykel/v-vim" })
	use({ "williamboman/nvim-lsp-installer" })

	-- use {"ziglang/zig.vim"}
	use({ "iamcco/markdown-preview.nvim" })
end)
