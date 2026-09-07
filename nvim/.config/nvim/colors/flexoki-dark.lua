vim.cmd.highlight("clear")

if vim.fn.exists("syntax_on") == 1 then
  vim.cmd.syntax("reset")
end

vim.o.background = "dark"
vim.g.colors_name = "flexoki-dark"

local p = {
  bg      = "#100F0F",
  bg2     = "#1C1B1A",
  bg3     = "#282726",

  text    = "#CECDC3",
  bright  = "#FFFCF0",
  muted   = "#878580",
  faint   = "#575653",

  red     = "#D14D41",
  orange  = "#DA702C",
  yellow  = "#D0A215",
  green   = "#879A39",
  cyan    = "#3AA99F",
  blue    = "#4385BE",
  purple  = "#8B7EC8",
  magenta = "#CE5D97",
}

local hi = vim.api.nvim_set_hl

-- ------------------------------------------------------------
-- Editor
-- ------------------------------------------------------------

hi(0, "Normal",       { fg = p.text, bg = p.bg })
hi(0, "NormalNC",     { fg = p.text, bg = p.bg })
hi(0, "NormalFloat",  { fg = p.text, bg = p.bg2 })

hi(0, "CursorLine",   { bg = p.bg2 })
hi(0, "CursorColumn", { bg = p.bg2 })

hi(0, "LineNr",       { fg = p.faint })
hi(0, "CursorLineNr", { fg = p.text, bold = true })

hi(0, "SignColumn",   { bg = p.bg })
hi(0, "VertSplit",    { fg = p.bg3 })
hi(0, "WinSeparator", { fg = p.bg3 })

hi(0, "Visual",       { bg = p.bg3 })
hi(0, "Search",       { fg = p.bg, bg = p.yellow })
hi(0, "IncSearch",    { fg = p.bg, bg = p.orange })

hi(0, "Pmenu",        { fg = p.text, bg = p.bg2 })
hi(0, "PmenuSel",     { fg = p.bright, bg = p.bg3, bold = true })

-- ------------------------------------------------------------
-- Syntax
-- ------------------------------------------------------------

hi(0, "Comment",    { fg = p.muted, italic = true })

hi(0, "Constant",   { fg = p.orange })
hi(0, "String",     { fg = p.green })
hi(0, "Character",  { fg = p.green })
hi(0, "Number",     { fg = p.orange })
hi(0, "Boolean",    { fg = p.orange })

hi(0, "Identifier", { fg = p.text })
hi(0, "Function",   { fg = p.blue })

hi(0, "Statement",  { fg = p.purple })
hi(0, "Conditional",{ fg = p.purple })
hi(0, "Repeat",     { fg = p.purple })
hi(0, "Operator",   { fg = p.muted })
hi(0, "Keyword",    { fg = p.purple })

hi(0, "PreProc",    { fg = p.magenta })
hi(0, "Type",       { fg = p.cyan })
hi(0, "Special",    { fg = p.yellow })

hi(0, "Underlined", { fg = p.blue, underline = true })
hi(0, "Todo",       { fg = p.yellow, bold = true })

-- ------------------------------------------------------------
-- Diagnostics
-- ------------------------------------------------------------

hi(0, "DiagnosticError", { fg = p.red })
hi(0, "DiagnosticWarn",  { fg = p.orange })
hi(0, "DiagnosticInfo",  { fg = p.blue })
hi(0, "DiagnosticHint",  { fg = p.cyan })

hi(0, "DiagnosticUnderlineError", {
  undercurl = true,
  sp = p.red,
})

hi(0, "DiagnosticUnderlineWarn", {
  undercurl = true,
  sp = p.orange,
})

-- ------------------------------------------------------------
-- Diff / Git
-- ------------------------------------------------------------

hi(0, "DiffAdd",    { fg = p.cyan, bg = p.bg2 })
hi(0, "DiffChange", { fg = p.yellow, bg = p.bg2 })
hi(0, "DiffDelete", { fg = p.red, bg = p.bg2 })
hi(0, "DiffText",   { fg = p.bright, bg = p.bg3, bold = true })
