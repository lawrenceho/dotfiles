return {
  -- Pin until upgrading to next version of Neovim
  -- { "example/example.nvim", pin = vim.fn.has("nvim-0.10") == 0 },
  { "akinsho/bufferline.nvim", pin = vim.fn.has("nvim-0.10") == 0 },
  { "NeogitOrg/neogit", pin = vim.fn.has("nvim-0.10") == 0 },
}
