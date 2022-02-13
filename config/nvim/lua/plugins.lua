local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    use 'romgrk/barbar.nvim'
    use {'dstein64/vim-startuptime', cmd = {'StartupTime'}}
    use 'ibhagwan/fzf-lua'
    use {'nvim-treesitter/nvim-treesitter', config = function () require('config.treesitter') end}
    use 'nvim-treesitter/nvim-treesitter-textobjects'
    use 'neovim/nvim-lspconfig'
    use {'williamboman/nvim-lsp-installer', config = function() require('config.lsp-installer') end}
    use {'numToStr/Comment.nvim', config = function() require('Comment').setup() end}
    use {'windwp/nvim-autopairs', config = function() require('nvim-autopairs').setup{} end}
    use {'lewis6991/gitsigns.nvim', requires = {'nvim-lua/plenary.nvim'}}
    use {'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true }, config = function() require('config.lualine') end}
    use {
        "hrsh7th/nvim-cmp",
        requires = {
            'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-path', 
            'onsails/lspkind-nvim', 'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip'
        },
        config = function() require('config.cmp') end
    }
end)
