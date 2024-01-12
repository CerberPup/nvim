return {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
    },
    lazy=true,
    keys = {
        {
            "<leader>et",
            function() require("trouble").toggle() end,
            desc = "Toggle trouble",
        },
        {
            "<leader>ew",
            function() require("trouble").toggle("workspace_diagnostics") end,
            desc = "Toggle trouble",
        },
        {
            "<leader>ed",
            function() require("trouble").toggle("document_diagnostics") end,
            desc = "Toggle trouble",
        },
        {
            "<leader>eq",
            function() require("trouble").toggle("quickfix") end,
            desc = "Toggle trouble",
        },
        {
            "<leader>el",
            function() require("trouble").toggle("loclist") end,
            desc = "Toggle trouble",
        },
        {
            "gR",
            function() require("trouble").toggle("lsp_references") end,
            desc = "Toggle trouble",
        },
    }
}
