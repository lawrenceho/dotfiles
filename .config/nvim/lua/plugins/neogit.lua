return {
  {
    "NeogitOrg/neogit",
    commit = vim.fn.has("nvim-0.10") == 0 and "bc0c609e3568a171e0549b449aa1b2b4b5b20e8c" or nil,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
    },
    keys = {
      {
        "<leader>gg",
        function()
          require("neogit").open()
        end,
        desc = "Neogit",
      },
    },
    opts = {
      commit_view = {
        verify_commit = false,
      },
    },
  },
}
