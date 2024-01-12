return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
    end,
    config = function ()
        local wk = require("which-key")
        wk.register({
            ["<leader>f"] = { name = "+Find" },
            ["<leader>c"] = { name = "+Code" },
            ["<leader>e"] = { name = "+Explain" },
        })
    end,
    opts = {

    }
}
