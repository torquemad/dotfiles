-- vim-jj is a Vimscript plugin. Its version guard predates Neovim's
-- v:version value (Neovim reports 801), so load its script with the
-- Neovim-compatible guard while keeping the plugin itself untouched.
local function load_vim_jj(plugin)
  vim.opt.runtimepath:append(plugin.path)

  local script = table.concat(vim.fn.readfile(plugin.path .. '/plugin/jj.vim'), '\n')
  script = script:gsub('v:version < 802', "!has('nvim') && v:version < 802")
  vim.cmd(script)
end

vim.pack.add({ 'https://github.com/mattjj/vim-jj' }, { load = load_vim_jj })

-- In a vim-jj status window, <CR> diffs the changed file under the cursor.
local status_diff_group = vim.api.nvim_create_augroup('vim_jj_status_diff', { clear = true })

local function diff_status_file(buf)
  local line = vim.api.nvim_buf_get_lines(buf, vim.api.nvim_win_get_cursor(0)[1] - 1,
    vim.api.nvim_win_get_cursor(0)[1], false)[1] or ''
  local path = line:match('^%s*[A-Z?!]+%s+(.+)$')

  if not path then
    vim.notify('Place the cursor on a changed file', vim.log.levels.INFO)
    return
  end

  -- vim-jj accepts backslash-escaped spaces in command arguments.
  path = path:gsub('\\', '\\\\'):gsub(' ', '\\ ')
  vim.cmd('J diff ' .. path)
end

vim.api.nvim_create_autocmd('BufWinEnter', {
  group = status_diff_group,
  callback = function(args)
    -- vim-jj installs its buffer variables and mappings while creating the
    -- window, so wait until that command has finished before checking it.
    vim.schedule(function()
      if not vim.api.nvim_buf_is_valid(args.buf) then
        return
      end

      local jj_args = vim.b[args.buf].jj_args
      if vim.bo[args.buf].buftype ~= 'nofile'
          or type(jj_args) ~= 'table'
          or jj_args[1] ~= 'status' then
        return
      end

      vim.keymap.set('n', '<CR>', function()
        diff_status_file(args.buf)
      end, { buffer = args.buf, silent = true, desc = 'jj diff file under cursor' })
    end)
  end,
})
