-- norcalli/snippets
require('snippets').use_suggested_mappings()

local zig_snip = require('snips.zig');
local lua_snip = require("snips.lua_snip");
local c_snip = require("snips.c");
local svelte_snip = require("snips.svelte");
local ts_snip = require("snips.ts");
local js_snip = require("snips.js");

require'snippets'.snippets = {
  -- The _global dictionary acts as a global fallback.
  -- If a key is not found for the specific filetype, then
  --  it will be lookup up in the _global dictionary.
  _global = {
    -- Insert a basic snippet, which is a string.
    todo = "TODO(ashkan): ";

    uname = function() return vim.loop.os_uname().sysname end;
    date = os.date;

    -- Evaluate at the time of the snippet expansion and insert it. You
    --  can put arbitrary lua functions inside of the =... block as a
    --  dynamic placeholder. In this case, for an anonymous variable
    --  which doesn't take user input and is evaluated at the start.
    epoch = "${=os.time()}";
    -- Equivalent to above.
    epoch = function() return os.time() end;

    -- Use the expansion to read the username dynamically.
    note = [[NOTE(${=io.popen("id -un"):read"*l"}): ]];

    -- Do the same as above, but by using $1, we can make it user input.
    -- That means that the user will be prompted at the field during expansion.
    -- You can *EITHER* specify an expression as a placeholder for a variable
    --  or a literal string/snippet using `${var:...}`, but not both.
    note = [[NOTE(${1=io.popen("id -un"):read"*l"}): ]];
  };
  zig = zig_snip,
  lua = lua_snip,
  c = c_snip,
  svelte = svelte_snip,
  typescript = ts_snip,
  typescriptreact = ts_snip,
  javascript = js_snip,
  javascriptreact = js_snip,
}

