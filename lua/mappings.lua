require "nvchad.mappings"
-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

--Exit and saving
map("n", "<leader>q", "<cmd>q<CR>", { desc = "Exit nvim" })
map("n", "<leader>w", "<cmd>w<CR>", { desc = "Save file" })
-- map("n", "<leader>x", "<cmd>x<CR>", { desc = "Save and quit" })
map("n", "<leader>t", "<cmd>q!<CR>", { desc = "Quit without saving" })

--Scrolling
map("n", "J", "jjjjj", { desc = "Scroll down cursor" })
map("n", "K", "kkkkk", { desc = "Scroll up cursor" })
map("n", "<C-j>", "<C-e><C-e><C-e><C-e><C-e><C-e>", { desc = "Scroll down view" })
map("n", "<C-k>", "<C-y><C-y><C-y><C-y><C-y><C-y>", { desc = "Scroll up view" })

--Cursor
map("i", "<C-f>", "<right>", { desc = "Move cursor right" })
map("i", "<C-b>", "<left>", { desc = "Move cursor left" })

--Ñ for delete
map("i", "Ñ", "<del>", { desc = "Delete with Ñ" })

--Visual mode maps
map("v", "<C-j>", "jjjjj", { desc = "Scroll down cursor" })
map("v", "J", "jjjjj", { desc = "Scroll down cursor" })
map("v", "<C-k>", "kkkkk", { desc = "Scroll up cursor" })
map("v", "K", "kkkkk", { desc = "Scroll up cursor" })
map("v", "<leader>jk", "<esc>", { desc = "Exit visual mode" })

--Hop (easymotion)
map("n", "<leader><leader>s", "<cmd>HopChar1<CR>", { desc = "[]Easymotion xd" })

map("n", "T", vim.lsp.buf.hover, { desc = "hover information" })
