-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Restore keymaps for next search result
vim.keymap.del({ "n", "x", "o" }, "n")
vim.keymap.del({ "n", "x", "o" }, "N")

-- Disable lazygit keymaps
vim.keymap.del("n", "<leader>gB")
vim.keymap.del("n", "<leader>gb")
vim.keymap.del("n", "<leader>gf")
vim.keymap.del("n", "<leader>gG")
vim.keymap.del("n", "<leader>gL")
vim.keymap.del("n", "<leader>gl")
