local ts_config = require("nvim-treesitter.configs")

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

-- parser_config.zig = {
--   install_info = {
--     url = "/home/himu/my_code/zig/projects/tree-sitter-zig",
--     files = {"src/parser.c"}
--   },
--   filetype = "zig"
-- }

local read_query = function(filename)
  return table.concat(vim.fn.readfile(vim.fn.expand(filename)), "\n")
end

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
    },
    query_linter = {
      enable = true,
      use_virtual_text = true,
      -- lint_events = { "BufWrite", "CursorHold"}
    }
}

vim.api.nvim_command("set foldmethod=expr")
vim.api.nvim_command("set foldexpr=nvim_treesitter#foldexpr()")

