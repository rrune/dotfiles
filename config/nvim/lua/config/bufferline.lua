require('barbar').setup{
  animation = false,
  auto_hide = true,
  tabpages = true,
  --[[ closable = false, ]]
  clickable = false,
  icons = { filetype = { enabled = false } },
  icon_custom_colors = false,
  insert_at_end = false,
  insert_at_start = false,
  maximum_padding = 1,
  maximum_length = 30,
  semantic_letters = true,
  letters = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP',
  no_name_title = nil,
}

local map = vim.api.nvim_set_keymap
local kopts = { noremap = true, silent = true }

map('n', '<A-Left>', ':BufferPrevious<CR>', kopts)
map('n', '<A-Right>', ':BufferNext<CR>', kopts)
map('n', '<A-h>', ':BufferPrevious<CR>', kopts)
map('n', '<A-l>', ':BufferNext<CR>', kopts)

map('n', '<A-1>', ':BufferGoto 1<CR>', kopts)
map('n', '<A-2>', ':BufferGoto 2<CR>', kopts)
map('n', '<A-3>', ':BufferGoto 3<CR>', kopts)
map('n', '<A-4>', ':BufferGoto 4<CR>', kopts)
map('n', '<A-5>', ':BufferGoto 5<CR>', kopts)
map('n', '<A-6>', ':BufferGoto 6<CR>', kopts)
map('n', '<A-7>', ':BufferGoto 7<CR>', kopts)
map('n', '<A-8>', ':BufferGoto 8<CR>', kopts)
map('n', '<A-9>', ':BufferGoto 9<CR>', kopts)
map('n', '<A-0>', ':BufferLast<CR>', kopts)

map('n', '<A-q>', ':BufferClose<CR>', kopts)
map('n', '<A-Q>', ':BufferCloseAllButCurrent<CR>', kopts)

map('n', '<A-p>', ':BufferPick<CR>', kopts)
