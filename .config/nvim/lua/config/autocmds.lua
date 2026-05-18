-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Set filetype for compose files
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  group = vim.api.nvim_create_augroup("compose_filetype", {}),
  pattern = {
    "compose*.yaml",
    "compose*.yml",
    "docker-compose*.yaml",
    "docker-compose*.yml",
  },
  callback = function()
    vim.opt_local.filetype = "yaml.docker-compose"
  end,
})

-- Disable diagnostics for env files
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  group = vim.api.nvim_create_augroup("env_disable_diagnostic", {}),
  pattern = ".env*",
  callback = function(args)
    vim.diagnostic.enable(false, { bufnr = args.buf })
  end,
})
