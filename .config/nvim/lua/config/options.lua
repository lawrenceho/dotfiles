-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Disable auto format
vim.g.autoformat = false

-- Number of spaces tabs count for
vim.opt.tabstop = 8

-- Disable tmux refresh added in this PR: https://github.com/neovim/neovim/pull/36787
-- Reading system clipboard would trigger security prompt in iTerm2
if vim.env.TMUX ~= nil and vim.fn.executable("tmux") == 1 then
  vim.g.clipboard = {
    name = "tmux",
    copy = {
      ["+"] = "tmux load-buffer -w -",
      ["*"] = "tmux load-buffer -w -",
    },
    paste = {
      ["+"] = "tmux save-buffer -",
      ["*"] = "tmux save-buffer -",
    },
  }

  -- Sync with system clipboard
  vim.opt.clipboard = "unnamedplus"
end
