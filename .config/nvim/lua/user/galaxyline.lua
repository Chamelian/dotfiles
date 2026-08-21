local colors = require("catppuccin.palettes").get_palette "mocha"

-- require("galaxyline").short_line_list = { "NvimTree_1" }

-- Left
require("galaxyline").section.left[0] = {
  Mode = {
    provider = function ()
      local currentMode = string.sub(vim.api.nvim_get_mode()["mode"], 1, 1)
      local modeOptions = {i = "INSERT", n = "NORMAL", v = "VISUAL", V = "VISUAL", s = "SELECT", R = "REPLACE", c = "CMDLINE", r = "PROMPT", t = "TERM" }
      return modeOptions[currentMode]
    end,
    condition = GenericConditon,
    highlight = { colors.mauve, colors.crust },
    separator = "",
    separator_highlight = { colors.crust, colors.mantle }
  }
}
require("galaxyline").section.left[1] = {
  FileIcon = {
    provider = "FileIcon",
    condition = GenericConditon,
    highlight = { colors.blue, colors.mantle},
  },
}
require("galaxyline").section.left[2] = {
  FileName = {
    provider = "FileName",
    condition = GenericConditon,
    highlight = { colors.blue, colors.mantle},
    separator = "",
    separator_highlight = { colors.mantle, colors.crust }
  },
}
require('galaxyline').section.left[3] = {
  FileSize = {
    provider = 'FileSize',
    condition = GenericConditon,
    icon = "  ",
    highlight = { colors.green, colors.crust},
    separator = '',
    separator_highlight = { colors.crust, colors.mantle },
  },
}
require("galaxyline").section.left[4] = {
  GitBranch = {
    provider = "GitBranch",
    condition = GenericConditon,
    icon = "  ",
    highlight = { colors.maroon, colors.mantle },
    separator = "",
    separator_highlight = { colors.mantle, colors.mantle }
  }
}

-- Right
require("galaxyline").section.right[9] = {
  GetLspClient = {
    provider = "GetLspClient",
    condition = GenericConditon,
    icon = '  ',
    highlight = { colors.lavender, colors.mantle },
    separator = "",
    separator_highlight = { colors.mantle, colors.crust }
  },
}
require("galaxyline").section.right[8] = {
  FileTypeName = {
    provider = "FileTypeName",
    condition = GenericConditon,
    highlight = { colors.maroon, colors.crust},
    separator = "",
    separator_highlight = { colors.crust, colors.mantle }
  }
}
require("galaxyline").section.right[7] = {
  DiagnosticError =  {
    provider = "DiagnosticError",
    condition = GenericConditon,
    icon = "  ",
    highlight = { colors.red, colors.mantle },
  },
}
require("galaxyline").section.right[6] = {
  DiagnosticWarn = {
    provider = "DiagnosticWarn",
    condition = GenericConditon,
    icon = "  ",
    highlight = { colors.yellow, colors.mantle },
    separator = "",
    separator_highlight = { colors.mantle }
  },
}
require("galaxyline").section.right[5] = {
  FileEncode = {
    provider = "FileEncode",
    condition = GenericConditon,
    highlight = { colors.sky, colors.mantle },
    separator = "",
    separator_highlight = { colors.mantle },
  },
}


function GenericConditon()
  if vim.fn.empty(vim.fn.expand("%:t")) ~= 1 then
    return true
  end
  return false
end
