function ConcatTables(t1, t2)
   for k,v in pairs(t2) do
       print(k)
      table.insert(t1, v)
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

