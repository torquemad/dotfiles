-- FZF - Fuzzy Finder
vim.pack.add { 'https://github.com/junegunn/fzf' }
vim.pack.add { 'https://github.com/junegunn/fzf.vim' }

-- FZF Configuration
vim.g.fzf_command_prefix = 'Fzf'
vim.g.fzf_layout = { window = { width = 0.9, height = 0.8 } }

-- Preview window configuration (toggle with ctrl-/)
vim.g.fzf_preview_window = { 'right:50%', 'ctrl-/' }

-- Custom file actions
vim.g.fzf_action = {
  ['ctrl-t'] = 'tab split',
  ['ctrl-x'] = 'split',
  ['ctrl-v'] = 'vsplit'
}

-- Use fd to list files, excluding lock files
vim.env.FZF_DEFAULT_COMMAND = 'fd --type f --hidden --follow --exclude ".git" --exclude "*lock*"'

-- Custom command to search contents in git status files
vim.cmd([[
command! -bang -nargs=* FzfRgGitStatus
  \ call fzf#vim#grep(
  \   'sh -c "git diff --name-only HEAD && git ls-files --others --exclude-standard" | xargs rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 
  \   1, 
  \   fzf#vim#with_preview(), 
  \   <bang>0)
]])

-- FZF Keybindings
vim.keymap.set('n', '<leader>ff', ':FzfFiles<CR>', { desc = 'FZF: Find files' })
vim.keymap.set('n', '<leader>fg', ':FzfRg<CR>', { desc = 'FZF: Ripgrep search' })
vim.keymap.set('n', '<leader>Ff', ':FzfGFiles?<CR>', { desc = 'FZF: Find git status files by name' })
vim.keymap.set('n', '<leader>Fg', ':FzfRgGitStatus<CR>', { desc = 'FZF: Search contents in git status files' })
vim.keymap.set('n', '<leader>fb', ':FzfBuffers<CR>', { desc = 'FZF: Buffers' })
vim.keymap.set('n', '<leader>fh', ':FzfHelptags<CR>', { desc = 'FZF: Help tags' })
vim.keymap.set('n', '<leader>fc', ':FzfCommands<CR>', { desc = 'FZF: Commands' })
vim.keymap.set('n', '<leader>fl', ':FzfBLines<CR>', { desc = 'FZF: Lines in current buffer' })
vim.keymap.set('n', '<leader>fL', ':FzfLines<CR>', { desc = 'FZF: Lines in all buffers' })
vim.keymap.set('n', '<leader>fm', ':FzfMarks<CR>', { desc = 'FZF: Marks' })
vim.keymap.set('n', '<leader>fw', ':FzfWindows<CR>', { desc = 'FZF: Windows' })
