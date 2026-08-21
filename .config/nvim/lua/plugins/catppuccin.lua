return {
  "catppuccin/nvim",
  name = "catppuccin",
  opts = {
    flavour = "mocha",
    custom_highlights = function(colors) return {
      Variable = { fg = colors.sapphire },
      Operator = { fg = colors.lavender },
      Comment = { style = { "italic" } },
      Function = { style = { "italic" } },
      Type = { fg = colors.mauve , style = { "italic" } },
      ["@variable"] = { fg = colors.sapphire },
      ["@variable.member"] = { fg = colors.sapphire },
      ["@variable.parameter"] = { style = { "italic" } },
      ["@variable.builtin"] = { style = { "italic" } },
    } end,
    auto_integrations = true,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false
    }
  },
  priority = 1000
}
