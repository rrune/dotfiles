local opt = vim.opt
local g = vim.g

opt.clipboard = 'unnamed,unnamedplus'

opt.splitright = true
opt.splitbelow = true

opt.hlsearch = true
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true

g.mapleader = ' '
g.title = true

vim.cmd [[set mouse=a]]

local disabled_built_ins = {
  "2html_plugin",
  "getscript",
  "getscriptPlugin",
  "gzip",
  "logipat",
  "netrw",
  "netrwPlugin",
  "netrwSettings",
  "netrwFileHandlers",
  "matchit",
  "tar",
  "tarPlugin",
  "rrhelper",
  "spellfile_plugin",
  "vimball",
  "vimballPlugin",
  "zip",
  "zipPlugin",
}

for _, plugin in pairs(disabled_built_ins) do
  vim.g["loaded_" .. plugin] = 1
end

local map = vim.api.nvim_set_keymap
local kopts = {noremap = true, silent = true}

map('n', '<C-h>', '<C-w>h', kopts)
map('n', '<C-j>', '<C-w>j', kopts)
map('n', '<C-k>', '<C-w>k', kopts)
map('n', '<C-l>', '<C-w>l', kopts)
map('n', '<C-Left>', '<C-w>h', kopts)
map('n', '<C-Down>', '<C-w>j', kopts)
map('n', '<C-Up>', '<C-w>k', kopts)
map('n', '<C-Right>', '<C-w>l', kopts)

map('n', '<leader>tt', ':terminal<CR>', kopts)
map('n', '<leader>tv', ':vs +terminal<CR>', kopts)
map('n', '<leader>ts', ':10sp +terminal<CR>', kopts)

--map('n', '<up>', '<nop>', kopts)
--map('n', '<down>', '<nop>', kopts)
--map('n', '<left>', '<nop>', kopts)
--map('n', '<right>', '<nop>', kopts)
--map('i', '<up>', '<nop>', kopts)
--map('i', '<down>', '<nop>', kopts)
--map('i', '<left>', '<nop>', kopts)
--map('i', '<right>', '<nop>', kopts)

require('plugins')
require('visual')
require('config.bufferline')
require('config.fzf')
