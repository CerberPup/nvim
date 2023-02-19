-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  is_bootstrap = true
  vim.fn.system { 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path }
  vim.cmd [[packadd packer.nvim]]
end

require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Theme
    use { "catppuccin/nvim", as = "catppuccin" }
    use 'nvim-lualine/lualine.nvim'
    use 'lukas-reineke/indent-blankline.nvim' -- Add indentation guides even on blank lines
    use 'numToStr/Comment.nvim' -- "gc" to comment visual regions/lines
    use 'tpope/vim-sleuth' -- Detect tabstop and shiftwidth automatically

    --Language packs
    use 'sheerun/vim-polyglot'

    --Nvim motions
    -- use 'phaazon/hop.nvim'

    -- TJ created lodash of neovim
    use("nvim-lua/popup.nvim")
    use{"nvim-telescope/telescope.nvim", requires = { 'nvim-lua/plenary.nvim' }}
    -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }

    use "folke/todo-comments.nvim"
    -- All the things
    use 'glepnir/lspsaga.nvim' --Powerful lsp fix, rename, jump thingy
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use { -- Autocompletion
        'hrsh7th/nvim-cmp',
        requires = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
    }
    use 'nvim-lua/lsp_extensions.nvim' -- podpowiedzi w postaci nazw argumentów funkcji
    use 'onsails/lspkind-nvim' -- piktogramy do autocomplete
    use "rafamadriz/friendly-snippets"
    use 'ray-x/lsp_signature.nvim'

    use { -- LSP Configuration & Plugins
        'neovim/nvim-lspconfig',
        requires = {
            -- Automatically install LSPs to stdpath for neovim
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',

            -- Useful status updates for LSP
            'j-hui/fidget.nvim',

            -- Additional lua configuration, makes nvim stuff amazing
            'folke/neodev.nvim',
        },
    }


    use	"windwp/nvim-autopairs" -- auto close parentheses

    -- use 'simrat39/symbols-outline.nvim' -- jump i rename z okienka

    use("mbbill/undotree")

    use { -- Highlight, edit, and navigate code
        'nvim-treesitter/nvim-treesitter',
        run = function()
            pcall(require('nvim-treesitter.install').update { with_sync = true })
        end,
    }

    use { -- Additional text objects via treesitter
        'nvim-treesitter/nvim-treesitter-textobjects',
        after = 'nvim-treesitter',
    }

    use("romgrk/nvim-treesitter-context") -- floating line of function you are inside

    --debugging
    use 'mfussenegger/nvim-dap'
    use 'jayp0521/mason-nvim-dap.nvim'
    use 'leoluz/nvim-dap-go'
    use 'rcarriga/nvim-dap-ui'
    use 'theHamsta/nvim-dap-virtual-text'
    use 'nvim-telescope/telescope-dap.nvim'

    --Grammar checking because I can't english
    use 'rhysd/vim-grammarous'

    --devicons
    use 'kyazdani42/nvim-web-devicons'

    --fullstack dev
    use 'pangloss/vim-javascript' --JS support
    use 'leafgarland/typescript-vim' --TS support
    use 'maxmellon/vim-jsx-pretty' --JS and JSX syntax
    use 'jparise/vim-graphql' --GraphQL syntax
    use 'mattn/emmet-vim'

    -- Git related plugins
    use 'tpope/vim-fugitive'
    use 'tpope/vim-rhubarb'
    use 'lewis6991/gitsigns.nvim'
    local has_plugins, plugins = pcall(require, 'custom.plugins')
    if has_plugins then
        plugins(use)
    end

    if is_bootstrap then
        require('packer').sync()
    end
    use "https://git.sr.ht/~whynothugo/lsp_lines.nvim"
end)

-- Automatically source and re-compile packer whenever you save this init.lua
local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
  command = 'source <afile> | PackerCompile',
  group = packer_group,
  pattern = vim.fn.expand '$MYVIMRC',
})
