local js = require("snips.js")

function ConcatTables(t1, t2)
	for k, v in pairs(t2) do
		t1[k] = v --corrected bug. if t1[#t1+i] is used, indices will be skipped
	end
	return t1
end

return ConcatTables({
	-- Enter TS
    tsignore = "// @ts-ignore"
}, js)
