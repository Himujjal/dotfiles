local ts_config = require("nvim-treesitter.configs")


local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

--[[ parser_config.svelte = {
  install_info = {
    url = "~/my_code/js/projects/tree-sitter-svelte", -- local path or git repo
    files = {"src/parser.c", "src/scanner.c"}
  },
  filetype = "svelte" --
} ]]

parser_config.zig = {
  install_info = {
    url = "~/my_code/zig/projects/tree-sitter-zig",
    files = {"src/parser.c"}
  },
  filetype = "zig"
}


ts_config.setup {
    ensure_installed = {
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
        "python"
    },
    highlight = {
        enable = true,
        use_languagetree = true
    },
    indent = {
      enable = true
    }
}

vim.api.nvim_command("set foldmethod=expr")
vim.api.nvim_command("set foldexpr=nvim_treesitter#foldexpr()")


