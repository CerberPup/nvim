return {
    { import = 'plugins.rust' },
    { import = 'plugins.webdev' },
    'lukas-reineke/indent-blankline.nvim', -- Add indentation guides even on blank lines
    'numToStr/Comment.nvim', -- "gc" to comment visual regions/lines
    'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically

    --Language packs
--    'sheerun/vim-polyglot',

    --Nvim motions
    -- 'phaazon/hop.nvim'

    -- TJ created lodash of neovim
    'nvim-lua/popup.nvim',
    {'nvim-telescope/telescope.nvim', dependencies = { 'nvim-lua/plenary.nvim' }},
    -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make', cond = vim.fn.executable 'make' == 1 },

    -- All the things
    'glepnir/lspsaga.nvim', --Powerful lsp fix, rename, jump thingy
    'nvim-lua/lsp_extensions.nvim', -- podpowiedzi w postaci nazw argumentów funkcji
    'onsails/lspkind-nvim', -- piktogramy do autocomplete
    'rafamadriz/friendly-snippets',
    'ray-x/lsp_signature.nvim',

    { -- LSP Configuration & Plugins
        'neovim/nvim-lspconfig',
        dependencies = {
            -- Automatically install LSPs to stdpath for neovim
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',

            -- Useful status updates for LSP
            'j-hui/fidget.nvim',

            -- Additional lua configuration, makes nvim stuff amazing
            'folke/neodev.nvim',
        },
    },


    'windwp/nvim-autopairs', -- auto close parentheses

    -- 'simrat39/symbols-outline.nvim' -- jump i rename z okienka

    --debugging
    'mfussenegger/nvim-dap',
    'jayp0521/mason-nvim-dap.nvim',
    'leoluz/nvim-dap-go',
    'rcarriga/nvim-dap-ui',
    'theHamsta/nvim-dap-virtual-text',
    'nvim-telescope/telescope-dap.nvim',

    --Grammar checking becaI can't english
    'rhysd/vim-grammarous',


    -- Git related plugins
    'tpope/vim-fugitive',
    'tpope/vim-rhubarb',
    'lewis6991/gitsigns.nvim',
}
