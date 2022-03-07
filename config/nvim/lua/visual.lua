local opt = vim.opt
local g = vim.g

opt.fillchars = { eob = ' ' }
opt.number = true
opt.background = 'dark'

vim.cmd [[
  colorscheme substrata-modified
]]


-- au TermOpen term://* setlocal nonumber | setfiletype terminal
