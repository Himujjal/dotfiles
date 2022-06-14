return {
	-- Snippets can be used inside of placeholders, but the variables used in
	-- the placeholder *must* be used outside of the placeholder. This could
	-- potentially change in the future if someone convinces me it's a good
	-- idea to support it. (it was a deliberate choice)
	req = [[local ${2:$1} = require '$1']],

	-- A snippet with a placeholder using :... and multiple variables.
	["for"] = "for ${1:i}, ${2:v} in ipairs(${3:t}) do\n$0\nend",
	-- This is equivalent to above, but looks nicer (to me) using [[]] strings.
	-- Notice $0 to indicate where the cursor should go at the end of expansion.
	["for"] = [[
for ${1:i}, ${2:v} in ipairs(${3:t}) do
  $0
end]],
}
