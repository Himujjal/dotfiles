local js = require("snips.js");

function ConcatTables(t1, t2)
  for k,v in pairs(t2) do
    t1[k] = v  --corrected bug. if t1[#t1+i] is used, indices will be skipped
  end
  return t1
end

return ConcatTables({
    -- Enter TS 
    init = [[<script lang="${1:ts}">
</script>
<h1>Hello</h1>
<style lang="postcss">
</style>]],
    script = [[<script lang="${1:ts}">$2</script>]],
    style = [[<style lang="${1:postcss}">$2</style>]],
    div = [[<div></div>]],
}, js);
