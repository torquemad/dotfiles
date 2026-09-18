vim.g.mapleader = ' '

vim.o.number = true
vim.o.relativenumber = true

-- Editor behavior
vim.o.confirm = true
vim.o.wrap = false
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.opt.swapfile = false
vim.o.signcolumn = "yes:1"
vim.o.winborder = "rounded"

-- Autocompletion
vim.o.completeopt = 'menu,menuone,noselect'
vim.o.complete = '.,w,b,u'

-- Filetype-specific indentation for JS/TS/React/CSS/HTML
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'css', 'html', 'json' },
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
  end,
})

