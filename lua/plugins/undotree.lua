return {
    'mbbill/undotree',
    cmd='UndotreeToggle',
    keys = {
        -- add a keymap to open neo-tree
        -- stylua: ignore
        {
            "<leader>u",
            function() vim.cmd(":UndotreeToggle") end,
            desc = "Open history picker (UndoTree)",
        },
    }
}
