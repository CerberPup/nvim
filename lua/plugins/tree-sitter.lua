return {{
    "romgrk/nvim-treesitter-context", -- floating line of function you are inside
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
        require("treesitter-context").setup({
            enable = true,   -- Enable this plugin (Can be enabled/disabled later via commands)
            max_lines = 3,   -- How many lines the window should span. Values <= 0 mean no limit.
            min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
            line_numbers = true,
            multiline_threshold = 20, -- Maximum number of lines to show for a single context
            trim_scope = "outer", -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
            mode = "cursor", -- Line used to calculate context. Choices: 'cursor', 'topline'
            -- Separator between context and content. Should be a single character string, like '-'.
            -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
            separator = nil,
            zindex = 20, -- The Z-index of the context window
            on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
        })
    end,
}, {
    "nvim-treesitter/nvim-treesitter",
    build = function()
        pcall(require("nvim-treesitter.install").update({ with_sync = true }))
    end,
    dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
    config = function()
        local configs = require("nvim-treesitter.configs")
        configs.setup({
            -- Add languages to be installed here that you want installed for treesitter
            ensure_installed = { "c", "cpp", "go", "lua", "python", "rust" },
            sync_install = false,
            auto_install = true,
            ignore_install = {},
            modules = {},
            highlight = { enable = true },
            indent = { enable = true, disable = { "python" } },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<c-space>",
                    node_incremental = "<c-space>",
                    scope_incremental = "<c-s>",
                    node_decremental = "<c-backspace>",
                },
            },
            -- textobjects = {
            --     select = {
            --         enable = true,
            --         lookahead = true, -- automatically jump forward to textobj, similar to targets.vim
            --         keymaps = {
            --             -- you can use the capture groups defined in textobjects.scm
            --             ['aa'] = '@parameter.outer',
            --             ['ia'] = '@parameter.inner',
            --             ['af'] = '@function.outer',
            --             ['if'] = '@function.inner',
            --             ['ac'] = '@class.outer',
            --             ['ic'] = '@class.inner',
            --         },
            --     },
            --     move = {
            --         enable = true,
            --         set_jumps = true, -- whether to set jumps in the jumplist
            --         goto_next_start = {
            --             [']m'] = '@function.outer',
            --             [']]'] = '@class.outer',
            --         },
            --         goto_next_end = {
            --             [']m'] = '@function.outer',
            --             [']['] = '@class.outer',
            --         },
            --         goto_previous_start = {
            --             ['[m'] = '@function.outer',
            --             ['[['] = '@class.outer',
            --         },
            --         goto_previous_end = {
            --             ['[m'] = '@function.outer',
            --             ['[]'] = '@class.outer',
            --         },
            --     },
            --     swap = {
            --         enable = true,
            --         swap_next = {
            --             ['<leader>a'] = '@parameter.inner',
            --         },
            --         swap_previous = {
            --             ['<leader>a'] = '@parameter.inner',
            --         },
            --     },
            -- },
        })
    end,
}}
