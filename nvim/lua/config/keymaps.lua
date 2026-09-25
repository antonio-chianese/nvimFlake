-- Comfort:
vim.keymap.set("n", "<leader>q", "<cmd>quit<CR>", { desc = "Quit buffer" })
vim.keymap.set("n", "<leader>w", "<cmd>write<CR>", { desc = "Save buffer" })
vim.keymap.set("n", ";", ":", { desc = "Enter command mode" })
vim.keymap.set("i", "jk", "<ESC>", { desc = "Enter normal mode" })

-- Formatting
vim.keymap.set({ 'n' }, '<C-f>', "magggqG`a", { desc = "Format entire file" }) -- use "gqap" for only formatting a paragraph
vim.keymap.set({ 'v' }, '<C-f>', "gq", { desc = "Format selected lines" }) -- use "gqap" for only formatting a paragraph

-- Language correction
vim.keymap.set("n", "<leader>lse", function() vim.opt.spelllang = "en" end, { desc = "Spellang en" })
vim.keymap.set("n", "<leader>lsi", function() vim.opt.spelllang = "it" end, { desc = "Spellang it" })
vim.keymap.set("n", "<leader>lsf", function() vim.opt.spelllang = "fr" end, { desc = "Spellang fr" })
vim.keymap.set("n", "<leader>lsb", function() vim.opt.spelllang = "en,it" end, { desc = "Spellang en, it" })

-- Correction
vim.keymap.set("i", "<c-l>", "<c-g>u<Esc>[s1z=`]a<c-g>u", { desc = "Correct errors with 1z=" })

-- Tabs
vim.keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
vim.keymap.set("n", "<leader>l", "<cmd>tabn<CR>", { desc = "Go to next tab" })
vim.keymap.set("n", "<leader>h", "<cmd>tabp<CR>", { desc = "Go to previous tab" })

-- Shell
vim.keymap.set("n", "<leader>b", "<cmd>vsplit term://bash<CR>", { desc = "Split a bash terminal" })
vim.keymap.set("t", "jk", [[<C-\><C-n>]], { desc = "Exit from terminal buffer" })
