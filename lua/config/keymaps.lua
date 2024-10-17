-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- noremap mappings
vim.keymap.set({ "c", "i" }, "jj", "<esc>")
vim.keymap.set("n", "<space>", ":")

-- my plugins keymap setting
vim.keymap.set("n", "<leader>u", ":UndotreeToggle<cr>")
vim.keymap.set("n", "fi", "gg=G")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "gts", "^i*<Space>[<Space>]<Space><Esc>")
