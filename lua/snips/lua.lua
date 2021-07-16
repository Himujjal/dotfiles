-- norcalli/snippets
require('snippets').use_suggested_mappings()

function ConcatTables(t1,t2)
  for k,v in pairs(t2) do
    t1[k] = v  --corrected bug. if t1[#t1+i] is used, indices will be skipped
  end
  return t1
end

local jsTsSnips = {
  cl = [[console.log($1)]]
}

local jsSnips = ConcatTables({
  requireJs = [[require($1);]]
}, jsTsSnips)

local typescriptSnips = ConcatTables({
  import = [[import $1 from '$2';]]
}, jsTsSnips)

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
  lua = {
    -- Snippets can be used inside of placeholders, but the variables used in
    -- the placeholder *must* be used outside of the placeholder. This could
    -- potentially change in the future if someone convinces me it's a good
    -- idea to support it. (it was a deliberate choice)
    req = [[local ${2:$1} = require '$1']];

    -- A snippet with a placeholder using :... and multiple variables.
    ["for"] = "for ${1:i}, ${2:v} in ipairs(${3:t}) do\n$0\nend";
    -- This is equivalent to above, but looks nicer (to me) using [[]] strings.
    -- Notice $0 to indicate where the cursor should go at the end of expansion.
    ["for"] = [[
for ${1:i}, ${2:v} in ipairs(${3:t}) do
  $0
end]];
  };
  c = {
    -- Variables can be repeated, and the value of what the user puts in will be
    -- expanded at every position where the bare variable is used (i.e. $1, $2...)
    ["#if"] = [[
#if ${1:CONDITION}
$0
#endif // $1
]];

    -- Here is where we get to advanced usage. The `|...` block is a transformation
    --  which is applied to the result of the variable *at the position*.
    -- Inside of this block, the special variable `S` is defined. Its usage should be
    --  obvious based on its usage in the following snippet. If not, read #Details below.
    --
    -- This is an important note:
    --   Transformations don't apply to every position for repeated variables, only
    --   at which it is defined.
    --
    -- You'll also see at the bottom `${|S[1]:gsub("%s+", "_")}`. This is a transformation
    --  just like above, except that without a variable name, it'll just be evaluated at
    --  the end of the snippet expansion. In this example, it's using the value of variable 1
    --  and replacing whitespace with underscores.
    guard = [[
#ifndef AK_${1:header name|S.v:upper():gsub("%s+", "_")}_H_
#define AK_$1_H_

// This is a header for $1

int ${1|S.v:lower():gsub("%s+", "_")} = 123;

$0

#endif // AK_${|S[1]:gsub("%s+", "_")}_H_
]];

    -- This is also illegal because it makes no sense, adding a transformation
    --  to an expression is redundant.
    -- ["inc"] = [[#include "${=vim.fn.expand("%:t")|S.v:upper()}"]];

    -- Just do this instead.
    inc = [[#include "${=vim.fn.expand("%:t"):upper()}"]];

    -- The final important note is the use of negative number variables.
    -- Negative variables *never* ask for user input, but otherwise behave
    --  like normal variables.
    -- This can be useful for storing the value of an expression, and repeating
    --  it in multiple locations.
    -- The following snippet will ask for the user's input using `input()` *once*,
    --  but use the value in multiple places.
    user_input = [[hey? ${-1=vim.fn.input("what's up? ")} = ${-1}]];
  };

  svelte = {
    start = [[<script lang="${1:ts}">$2</script>
<h1>Hello</h1>
<style lang="postcss"></style>
    ]];
    script = [[<script lang="${1:ts}">$2</script>]];
    style = [[<style lang="${1:postcss}">$2</style>]];
    div = [[<div></div>]];
    cl = [[console.log($1)]];
  },
  html = {
    html = [[<!DOCTYPE html>
<html>
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="stylesheet" href="style.css" />
    <title>App</title>
  </head>
  <body>
  </body>
  <script src="main.js"></script>
</html>]]
  },
  typescript = typescriptSnips,
  typescriptreact = typescriptSnips,
  javascript = jsSnips,
  javascriptreact = jsSnips,
}

