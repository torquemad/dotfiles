-- LSP Configuration
vim.pack.add { 'https://github.com/neovim/nvim-lspconfig' }

-- Lua Language Server
vim.lsp.config('lua_ls', {
    settings = {
        Lua = {
            workspace = {
                checkThirdParty = false,
                library = {
                    vim.env.VIMRUNTIME,
                },
            },
        },
    },
})

-- Go Language Server
vim.lsp.config('gopls', {
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
                shadow = true,
            },
            staticcheck = true,
            gofumpt = false,
        },
    },
})

-- TypeScript / React Language Server
vim.lsp.config('ts_ls', {})

-- CSS Language Server
vim.lsp.config('cssls', {})

-- Enable language servers
vim.lsp.enable('lua_ls')
vim.lsp.enable('gopls')
vim.lsp.enable('ts_ls')
vim.lsp.enable('cssls')

-- Format Go files on save (gofmt via gopls)
vim.api.nvim_create_autocmd('BufWritePre', {
    pattern = '*.go',
    callback = function()
        vim.lsp.buf.format({ async = false })
    end,
})

-- Enable LSP completion (built-in, Neovim 0.11+)
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client:supports_method('textDocument/completion') then
      -- Expand trigger characters to all printable ASCII so completion fires as you type
      local chars = {}
      for i = 32, 126 do chars[#chars + 1] = string.char(i) end
      client.server_capabilities.completionProvider.triggerCharacters = chars
      vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
    end
  end,
})

-- LSP Keymaps
vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'LSP Hover Documentation' })
vim.keymap.set('n', 'E', vim.diagnostic.open_float, { desc = 'Show Diagnostic' })
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = 'Go to definition' })
vim.keymap.set('n', 'gr', vim.lsp.buf.references, { desc = 'Find references' })
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = 'Rename symbol' })
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = 'Code actions' })
vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format, { desc = 'Format code' })
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Previous diagnostic' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Next diagnostic' })
vim.keymap.set('n', 'gI', vim.lsp.buf.implementation, { desc = 'Go to implementation' })
vim.keymap.set('n', 'gy', vim.lsp.buf.type_definition, { desc = 'Go to type definition' })
