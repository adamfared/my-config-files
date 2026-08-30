local function apply_kitty_colors()
  -- Strip default background highlights so Kitty's #000000 background shows
  local transparent_groups = {
    "Normal",
    "NormalNC",
    "NormalFloat",
    "FloatBorder",
    "SignColumn",
    "LineNr",
    "CursorLine",
    "CursorLineNr",
    "StatusLine",
    "StatusLineNC",
    "NeoTreeNormal",
    "NeoTreeNormalNC",
    "NvimTreeNormal",
    "EndOfBuffer",
  }

  for _, group in ipairs(transparent_groups) do
    vim.api.nvim_set_hl(0, group, { bg = "NONE", ctermbg = "NONE" })
  end

  -- Map key UI syntax elements directly to your Kitty ANSI colors:
  -- ctermfg numbers map to Kitty colors:
  -- 1/9 = Red (#ff6575 / #ff7b89)
  -- 2/10 = Green (#4fd6be / #72f8dd)
  -- 3/11 = Yellow (#e3d182 / #f3e293)
  -- 5/13 = Magenta (#d183ff / #e2a3ff)
  -- 7/15 = White (#c4c8d4 / #ffffff)
  
  vim.api.nvim_set_hl(0, "Keyword", { ctermfg = 1, bold = true })   -- Red accent
  vim.api.nvim_set_hl(0, "Function", { ctermfg = 5 })               -- Magenta
  vim.api.nvim_set_hl(0, "String", { ctermfg = 2 })                 -- Green
  vim.api.nvim_set_hl(0, "Constant", { ctermfg = 3 })               -- Yellow
  vim.api.nvim_set_hl(0, "Visual", { ctermbg = 1, ctermfg = 0 })     -- Kitty selection style (#ff6575 background)
end

vim.api.nvim_create_autocmd({ "ColorScheme", "VimEnter" }, {
  callback = apply_kitty_colors,
})

local function set_transparent_background()
  local groups = {
    "Normal",
    "NormalNC",
    "NormalFloat",
    "FloatBorder",
    "SignColumn",
    "LineNr",
    "CursorLine",
    "CursorLineNr",
    "StatusLine",
    "StatusLineNC",
    "NeoTreeNormal",
    "NeoTreeNormalNC",
    "EndOfBuffer",
  }
  for _, group in ipairs(groups) do
    vim.api.nvim_set_hl(0, group, { bg = "NONE", ctermbg = "NONE" })
  end
end

vim.api.nvim_create_autocmd({ "ColorScheme", "VimEnter" }, {
  callback = set_transparent_background,
})

set_transparent_background()
