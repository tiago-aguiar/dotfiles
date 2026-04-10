vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then
  vim.cmd("syntax reset")
end

vim.o.background = "dark"
vim.g.colors_name = "taguiar-dark"

local set_hl = vim.api.nvim_set_hl

set_hl(0, "Normal",         { fg = "#EED5B7", bg = "#000000" })
set_hl(0, "CursorLine",     { bg = "#1A1A1A" })
set_hl(0, "Visual",         { fg = "#e0e0e0", bg = "#000000" })

set_hl(0, "StatusLine",     { fg = "#F5DEB3", bg = "#000000" })
set_hl(0, "StatusLineNC",   { fg = "#4D4D4D", bg = "#000000" })

set_hl(0, "Comment",        { fg = "#7F7F7F" })
set_hl(0, "Constant",       { fg = "#9ACD32" })
set_hl(0, "String",         { fg = "#8B8B00" })
set_hl(0, "Identifier",     { fg = "#CDBA96" })
set_hl(0, "Function",       { fg = "#A2CD5A" })
set_hl(0, "Statement",      { fg = "#9ACD32" })
set_hl(0, "Keyword",        { fg = "#9ACD32" })
set_hl(0, "PreProc",        { fg = "#9ACD32" })
set_hl(0, "Type",           { fg = "#8B6969" })
set_hl(0, "Special",        { fg = "#8B6969" })
set_hl(0, "StorageClass",   { fg = "#9ACD32" })
set_hl(0, "Structure",      { fg = "#9ACD32" })
set_hl(0, "SpecialComment", { fg = "#696969" })

set_hl(0, "Search",         { fg = "#000000", bg = "#00FF00" })
set_hl(0, "MatchParen",     { fg = "#00FF7F", bold = true })

set_hl(0, "Error",          { fg = "#CCCCCC", bg = "#8B0000" })
set_hl(0, "Todo",           { fg = "#FF0000", bold = true })

set_hl(0, "Directory",      { fg = "#008B8B" })
set_hl(0, "Include",        { fg = "#9ACD32" })

set_hl(0, "Title",          { fg = "#9ACD32" })
set_hl(0, "Underlined",     { fg = "#8B6969", underline = true })


print("terminator theme loaded")
