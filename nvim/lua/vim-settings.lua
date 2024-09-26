vim.g.mapleader = " "
-- spacing settings
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
-- general settings
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.breakindent = true
vim.opt.clipboard = "unnamedplus" -- enable system clipboard
vim.opt.fileencoding = "utf-8" -- default utf-8 enconding for files
vim.opt.showmode = false -- show the modes in the window (no need for this since we use lualine)
vim.opt.cursorline = true -- highlight the cursor line
-- searching
vim.opt.hlsearch = true -- highlight all occurences
vim.opt.ignorecase = true -- ignore case while searching
vim.opt.smartcase = true -- match case if explicitly used
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", {desc = "Remove search hilights"})
-- window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", {desc = "move focus to the left window"})
vim.keymap.set("n", "<C-l>", "<C-w>l", {desc = "move focus to the right window"})
vim.keymap.set("n", "<C-j>", "<C-w>j", {desc = "move focus to the lower window"})
vim.keymap.set("n", "<C-k>", "<C-w>k", {desc = "move focus to the upper window"})
