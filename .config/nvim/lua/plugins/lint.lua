return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "sonarlint-language-server" })
    end,
  },
  {
    "https://gitlab.com/schrieveslaach/sonarlint.nvim.git",
    ft = { "java" },
    config = function()
      require("sonarlint").setup({
        server = {
          cmd = {
            "java",
            "-Dsonarlint.telemetry.disabled=true",
            "-Duser.home=" .. vim.fn.stdpath("state"),
            "-jar",
            vim.fn.expand("$MASON/packages/sonarlint-language-server/extension/server/sonarlint-ls.jar"),
            "-stdio",
            "-analyzers",
            vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarjava.jar"),
          },
        },
        filetypes = {
          "java",
        },
      })
    end,
  },
}
