vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") then
  vim.cmd("syntax reset")
end

vim.g.colors_name = "kitty-custom"

local theme = {
  bg = "NONE",
  fg = "#c4c8d4",
  red = "#ff6575",
  red_light = "#ff7b89", -- Light Red Accent
  green = "#4fd6be",
  yellow = "#e3d182",
  magenta = "#d183ff",
  grey = "#52586b",
  selection = "#ff6575",
}

local hl = function(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- --- Base UI & Transparency ---
hl("Normal", { fg = theme.fg, bg = theme.bg })
hl("NormalNC", { fg = theme.fg, bg = theme.bg })
hl("NormalFloat", { fg = theme.fg, bg = theme.bg })
hl("FloatBorder", { fg = theme.red_light, bg = theme.bg })
hl("FloatTitle", { fg = theme.red_light, bg = theme.bg, bold = true })
hl("SignColumn", { bg = theme.bg })
hl("LineNr", { fg = theme.grey })
hl("CursorLine", { bg = "NONE" })
hl("CursorLineNr", { fg = theme.red_light, bold = true })
hl("Visual", { bg = theme.selection, fg = "#000000" })

-- --- Dashboard & Icons ---
hl("NvimTreeFolderIcon", { fg = theme.red_light })
hl("NvimTreeFileIcon", { fg = theme.red_light })
hl("MiniIconsRed", { fg = theme.red_light })
hl("MiniIconsOrange", { fg = theme.red_light })
hl("MiniIconsYellow", { fg = theme.red_light })
hl("MiniIconsGreen", { fg = theme.red_light })
hl("MiniIconsBlue", { fg = theme.red_light })
hl("MiniIconsPurple", { fg = theme.red_light })
hl("MiniIconsGrey", { fg = theme.red_light })

hl("SnacksDashboardHeader", { fg = theme.red_light, bold = true })
hl("SnacksDashboardIcon", { fg = theme.red_light })
hl("SnacksDashboardKey", { fg = theme.red_light })
hl("SnacksDashboardDesc", { fg = theme.fg })
hl("SnacksDashboardFooter", { fg = theme.grey, italic = true })

-- --- Telescope & Pickers ---
hl("TelescopeNormal", { fg = theme.fg, bg = theme.bg })
hl("TelescopeBorder", { fg = theme.red_light, bg = theme.bg })
hl("TelescopePromptBorder", { fg = theme.red_light, bg = theme.bg })
hl("TelescopePromptNormal", { fg = theme.fg, bg = theme.bg })
hl("TelescopePromptPrefix", { fg = theme.red_light })
hl("TelescopeSelection", { bg = theme.red_light, fg = "#000000", bold = true })
hl("TelescopeSelectionCaret", { fg = "#000000" })
hl("TelescopePreviewTitle", { fg = theme.red_light, bold = true })
hl("TelescopePromptTitle", { fg = theme.red_light, bold = true })
hl("TelescopeResultsTitle", { fg = theme.red_light, bold = true })

-- --- Code Syntax & Treesitter ---
hl("Keyword", { fg = theme.red, bold = true })
hl("Statement", { fg = theme.red })
hl("Function", { fg = theme.magenta })
hl("String", { fg = theme.green })
hl("Boolean", { fg = theme.yellow })
hl("Number", { fg = theme.yellow })
hl("Constant", { fg = theme.yellow })
hl("Comment", { fg = theme.grey, italic = true })
hl("Identifier", { fg = theme.fg })

hl("@keyword", { fg = theme.red, bold = true })
hl("@keyword.import", { fg = theme.red_light, bold = true })
hl("@function", { fg = theme.magenta })
hl("@function.builtin", { fg = theme.magenta })
hl("@string", { fg = theme.green })
hl("@string.path", { fg = theme.green, underline = true })
hl("@boolean", { fg = theme.yellow })
hl("@number", { fg = theme.yellow })
hl("@variable", { fg = theme.fg })
hl("@variable.member", { fg = theme.red_light })
hl("@variable.parameter", { fg = theme.red_light })
hl("@property", { fg = theme.red_light })
hl("@comment", { fg = theme.grey, italic = true })
hl("@punctuation.delimiter", { fg = theme.red_light })
hl("@punctuation.bracket", { fg = theme.fg })
hl("@operator", { fg = theme.red })
-- --- Fully Transparent Statusline Overrides ---
hl("StatusLine", { fg = theme.fg, bg = "NONE" })
hl("StatusLineNC", { fg = theme.grey, bg = "NONE" })

-- Force transparency on Lualine background containers
hl("lualine_c_normal", { fg = theme.fg, bg = "NONE" })
hl("lualine_c_inactive", { fg = theme.grey, bg = "NONE" })
hl("lualine_b_normal", { fg = theme.red_light, bg = "NONE" })
hl("lualine_b_insert", { fg = theme.red_light, bg = "NONE" })
hl("lualine_b_visual", { fg = theme.red_light, bg = "NONE" })
hl("lualine_x_normal", { fg = theme.red_light, bg = "NONE" })
hl("lualine_y_normal", { fg = theme.red_light, bg = "NONE" })

-- Transition separators / powerline glyphs
hl("lualine_transitional_lualine_a_normal_to_lualine_b_normal", { fg = theme.red_light, bg = "NONE" })
hl("lualine_transitional_lualine_b_normal_to_lualine_c_normal", { fg = theme.red_light, bg = "NONE" })
