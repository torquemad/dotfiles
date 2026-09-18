-- Escape from insert mode
vim.keymap.set('i', 'jk', '<Esc>', { desc = 'Exit insert mode' })
vim.keymap.set('i', 'kj', '<Esc>', { desc = 'Exit insert mode' })

-- Completion
vim.keymap.set('i', '<C-Space>', function() vim.lsp.completion.trigger() end, { desc = 'Trigger LSP completion' })

-- I/O
vim.keymap.set('n', '<leader>o', ':update<CR> :source<CR>', { desc = 'Save and source file' })
vim.keymap.set('n', '<leader>w', ':write<CR>', { desc = 'Write file' })
vim.keymap.set('n', '<leader>q', ':quit<CR>', { desc = 'Quit' })

-- Yank to system clipboard
vim.keymap.set({ 'n', 'v', 'x' }, '<leader>y', '"+y<CR>', { desc = 'Yank to system clipboard' })
vim.keymap.set({ 'n', 'v', 'x' }, '<leader>d', '"+d<CR>', { desc = 'Delete to system clipboard' })

-- Buffer management and navigation
vim.keymap.set('n', '<leader>bd', ':bp|bd #<CR>', { desc = 'Delete buffer (keep split)' })
vim.keymap.set({ 'n', 'v', 'x' }, '<leader>s', ':e #<CR>', { desc = 'Switch to alternate buffer' })
vim.keymap.set({ 'n', 'v', 'x' }, '<leader>Sd', ':sf #<CR>', { desc = 'Split alternate buffer' })
vim.keymap.set('n', '<leader>bn', ':bnext<CR>', { desc = 'Next buffer' })
vim.keymap.set('n', '<leader>bp', ':bprevious<CR>', { desc = 'Previous buffer' })
