local actions = require "fzf-lua.actions"

require'fzf-lua'.setup {
  fzf_opts = {
    ['--layout'] = false,
    ['--height'] = '100%',
  },
  files = {
    previewer = false,
  },
  buffers = {
    previewer = false,
  }
}

local map = vim.api.nvim_set_keymap
local kopts = {noremap = true, silent = true}

map('n', '<leader>ff', ':FzfLua files<CR>', kopts)
map('n', '<leader>fF', ':FzfLua files cwd=%:p:h<CR>', kopts)
map('n', '<leader>fb', ':FzfLua buffers<CR>', kopts)
