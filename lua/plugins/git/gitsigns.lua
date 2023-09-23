return {
    'lewis6991/gitsigns.nvim',
    opts = function()
    require('gitsigns').setup {
        signs = {
            add = { text = '+' },
            change = { text = '~' },
            delete = { text = '_' },
            topdelete = { text = '‾' },
            changedelete = { text = '~' },
        }
    }
    end
    -- Gitsigns
    -- See `:help gitsigns.txt`
}
