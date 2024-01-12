return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    keys = {
      -- add a keymap to open neo-tree
      -- stylua: ignore
      {
        "<c-t>",
        function() vim.cmd(":Neotree filesystem reveal left") end,
        desc = "Open file picker (NeoTree)",
      },
    },
}
