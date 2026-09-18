-- Oil.nvim - File explorer
vim.pack.add { 'https://github.com/stevearc/oil.nvim' }

require('oil').setup({
  keymaps = {
    ["<C-s>"] = {
      callback = function()
        require("oil").select({ vertical = true, split = "belowright" })
      end,
      desc = "Open in vertical split (right)",
    },
    ["<C-h>"] = {
      callback = function()
        require("oil").select({ horizontal = true, split = "belowright" })
      end,
      desc = "Open in horizontal split (below)",
    },
  },
})

vim.keymap.set('n', '<leader>e', '<CMD>Oil<CR>', { desc = 'Explore parent directory' })
