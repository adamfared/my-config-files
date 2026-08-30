return {
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      local custom_red = "#ff7b89"
      local custom_bg = "NONE"
      local custom_dark = "#16161a"

      local custom_theme = {
        normal = {
          a = { bg = custom_red, fg = custom_dark, gui = "bold" },
          b = { bg = custom_bg, fg = custom_red },
          c = { bg = custom_bg, fg = "#c4c8d4" },
          x = { bg = custom_bg, fg = custom_red },
          y = { bg = custom_bg, fg = custom_red },
          z = { bg = custom_red, fg = custom_dark, gui = "bold" },
        },
        insert = {
          a = { bg = custom_red, fg = custom_dark, gui = "bold" },
          b = { bg = custom_bg, fg = custom_red },
          c = { bg = custom_bg, fg = "#c4c8d4" },
          z = { bg = custom_red, fg = custom_dark, gui = "bold" },
        },
        visual = {
          a = { bg = custom_red, fg = custom_dark, gui = "bold" },
          z = { bg = custom_red, fg = custom_dark, gui = "bold" },
        },
      }

      opts.options.theme = custom_theme
    end,
  },
}
