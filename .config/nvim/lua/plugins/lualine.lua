local icons = require("lazyvim.config").icons

return {
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        component_separators = "|",
        section_separators = "",
      },
      sections = {
        lualine_c = {
          LazyVim.lualine.root_dir(),
          {
            "diagnostics",
            symbols = {
              error = icons.diagnostics.Error,
              warn = icons.diagnostics.Warn,
              info = icons.diagnostics.Info,
              hint = icons.diagnostics.Hint,
            },
          },
          { "fileformat", icon_only = true, separator = "", padding = { left = 1, right = 1 } },
          { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
          { LazyVim.lualine.pretty_path() },
        },
        lualine_y = {
          { "progress", separator = " ", padding = { left = 1, right = 1 } },
        },
        lualine_z = {
          {
            -- Fix "location"
            -- https://github.com/nvim-lualine/lualine.nvim/pull/1243
            function()
              return string.format("%3d:%-2d", vim.fn.line("."), vim.fn.charcol("."))
            end,
            padding = { left = 1, right = 1 },
          },
        },
      },
    },
  },
}
