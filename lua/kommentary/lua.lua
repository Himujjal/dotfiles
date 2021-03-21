-- refer: https://github.com/b3nj5m1n/kommentary#default-keybindings

require('kommentary.config').use_extended_mappings()

-- n, gcc -> toggle line comment
-- v, gc -> toggle line comment (visual)
-- n, <leader>cic -> comment line increase
-- "<leader>cic" will increase commenting level for the current line, ci will do the same for a visual selection or motion
-- "<leader>cdc" will decrease commenting level for the current line, di will do the same for a visual selection or motion
