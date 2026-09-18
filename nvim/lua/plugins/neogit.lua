-- Neogit - Magit-style git UI
vim.pack.add { 'https://github.com/neogitorg/neogit' }

require('neogit').setup()

vim.keymap.set("n", "<leader>gg", "<cmd>Neogit<cr>", { desc = "Open Neogit UI" })
