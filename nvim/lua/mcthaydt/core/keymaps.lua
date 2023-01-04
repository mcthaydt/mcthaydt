vim.g.mapleader = " "

local keymap = vim.keymap

-- General Keymaps

keymap.set("i", "kj", "<ESC>")

keymap.set("n", "<leader>nh", ":nohl<CR>")

keymap.set("n", "x", '"_x')

keymap.set("n", "<leader>+", "<C-a>")
keymap.set("n", "<leader>-", "<C-x>")

keymap.set("n", "<leader>sv", "<C-w>v") -- Split Vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- Split Horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- Split Equal Width
keymap.set("n", "<leader>sx", ":close<CR>") -- Close Split Window

keymap.set("n", "<leader>to", ":tabnew<CR>") -- New Tab 
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- Close Tab 
keymap.set("n", "<leader>tn", ":tabn<CR>") -- Next Tab 
keymap.set("n", "<leader>tp", ":tabp<CR>") -- Previous Tab 

-- Plugin Keymaps

-- Vim-Maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")
-- Nvim-Tree 
keymap.set("n", "<leader>t", ":NvimTreeToggle<CR>")
-- Telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags
