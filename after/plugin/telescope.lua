local builtin = require('telescope.builtin')

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')

vim.keymap.set('n', '<Tab><Tab>', builtin.find_files, {})
vim.keymap.set('n', '<Tab>g', builtin.live_grep, {})
vim.keymap.set('n', '<leader>sk', builtin.keymaps, {})

-- Open telescope if vim with no arguments
vim.api.nvim_create_augroup('startup', { clear = true })
vim.api.nvim_create_autocmd('VimEnter', {
  group = 'startup',
  pattern = '*',
  callback = function()
    -- Open file browser if argument is a folder
    local arg = vim.api.nvim_eval('argv(0)')
    if arg and (vim.fn.isdirectory(arg) ~= 0 or arg == "") then
      vim.defer_fn(function()
        builtin.find_files()
      end, 10)
    end
  end
})
