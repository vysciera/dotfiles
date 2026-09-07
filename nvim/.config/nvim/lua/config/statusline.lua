local colors = {
  bg     = "#100F0F",
  bg2    = "#1C1B1A",
  text   = "#CECDC3",
  muted  = "#878580",

  red    = "#D14D41",
  orange = "#DA702C",
  yellow = "#D0A215",
  green  = "#879A39",
  cyan   = "#3AA99F",
  blue   = "#4385BE",
  purple = "#8B7EC8",
}

local theme = {
  normal = {
    a = { fg = colors.bg, bg = colors.blue, gui = "bold" },
    b = { fg = colors.text, bg = colors.bg2 },
    c = { fg = colors.muted, bg = colors.bg },
  },

  insert = {
    a = { fg = colors.bg, bg = colors.green, gui = "bold" },
  },

  visual = {
    a = { fg = colors.bg, bg = colors.purple, gui = "bold" },
  },

  replace = {
    a = { fg = colors.bg, bg = colors.red, gui = "bold" },
  },

  command = {
    a = { fg = colors.bg, bg = colors.orange, gui = "bold" },
  },

  inactive = {
    a = { fg = colors.muted, bg = colors.bg },
    b = { fg = colors.muted, bg = colors.bg },
    c = { fg = colors.muted, bg = colors.bg },
  },
}

require("lualine").setup({
  options = {
    theme = theme,

    icons_enabled = true,

    component_separators = {
      left = "",
      right = "",
    },

    section_separators = {
      left = "",
      right = "",
    },

    globalstatus = true,
  },

  sections = {
    lualine_a = {
      {
        "mode",
        fmt = function(mode)
          local names = {
            NORMAL   = "N",
            INSERT   = "I",
            VISUAL   = "V",
            ["V-LINE"] = "VL",
            ["V-BLOCK"] = "VB",
            REPLACE  = "R",
            COMMAND  = "C",
          }

          return names[mode] or mode
        end,
      },
    },

    lualine_b = {
      {
        "branch",
        icon = "",
      },
      "diff",
    },

    lualine_c = {
      {
        "filename",
        path = 1,
        symbols = {
          modified = " ",
          readonly = " ",
          unnamed = "[No Name]",
          newfile = " ",
        },
      },
    },

    lualine_x = {
      "diagnostics",
      "encoding",
      "filetype",
    },

    lualine_y = {
      "progress",
    },

    lualine_z = {
      "location",
    },
  },

  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { "filename" },
    lualine_x = { "location" },
    lualine_y = {},
    lualine_z = {},
  },
})
