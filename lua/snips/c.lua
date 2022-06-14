return {
	-- Variables can be repeated, and the value of what the user puts in will be
	-- expanded at every position where the bare variable is used (i.e. $1, $2...)
	["#if"] = [[
#if ${1:CONDITION}
$0
#endif // $1
]],

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
]],

	-- This is also illegal because it makes no sense, adding a transformation
	--  to an expression is redundant.
	-- ["inc"] = [[#include "${=vim.fn.expand("%:t")|S.v:upper()}"]];

	-- Just do this instead.
	inc = [[#include "${=vim.fn.expand("%:t"):upper()}"]],

	-- The final important note is the use of negative number variables.
	-- Negative variables *never* ask for user input, but otherwise behave
	--  like normal variables.
	-- This can be useful for storing the value of an expression, and repeating
	--  it in multiple locations.
	-- The following snippet will ask for the user's input using `input()` *once*,
	--  but use the value in multiple places.
	user_input = [[hey? ${-1=vim.fn.input("what's up? ")} = ${-1}]],
}
