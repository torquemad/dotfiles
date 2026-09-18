-- Treesitter Syntax Highlighting (Modern v1.0.0+ specification)
vim.pack.add { 'https://github.com/nvim-treesitter/nvim-treesitter' }

-- Initialize Treesitter with default settings
require('nvim-treesitter').setup()

-- Install web-dev parsers (runs asynchronously)
require('nvim-treesitter').install { 'typescript', 'tsx', 'javascript', 'css', 'html', 'json' }

-- Enable Treesitter Highlighting and Indentation for these filetypes
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'typescript', 'typescriptreact', 'javascript', 'javascriptreact', 'css', 'html', 'json' },
  callback = function()
    vim.treesitter.start()
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})
