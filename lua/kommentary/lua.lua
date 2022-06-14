-- refer: https://github.com/b3nj5m1n/kommentary#default-keybindings

local conf = require("kommentary.config")
local configure_language = conf.configure_language

conf.use_extended_mappings()
-- n, gcc -> toggle line comment
-- v, gc -> toggle line comment (visual)
-- n, <leader>cic -> comment line increase
-- "<leader>cic" will increase commenting level for the current line, ci will do the same for a visual selection or motion
-- "<leader>cdc" will decrease commenting level for the current line, di will do the same for a visual selection or motion

-- configure_language("zig", {
--   single_line_comment_string = "//",
--   prefer_single_line_comments = true,
-- })

local langs = {
	"c",
	"cpp",
	"javascript",
	"typescript",
	"java",
	"zig",
}

configure_language("lua", {
	single_line_comment_string = "--",
	prefer_single_line_comments = true,
})

for _, val in pairs(langs) do
	configure_language(val, {
		prefer_single_line_comments = true,
	})
end
