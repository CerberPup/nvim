return {
      -- change some telescope options and a keymap to browse plugin files
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
      -- add a keymap to browse plugin files
      -- stylua: ignore
      {
        "<leader>fpf",
        function() require("telescope.builtin").find_files({ cwd = '~/.config/nvim/lua' }) end,
        desc = "[F]ind [P]lugin [F]ile",
      },
      {
        '<leader>fpg',
        function() require('telescope.builtin').live_grep({ cwd = '~/.config/nvim/lua' }) end,
        desc = '[F]ind [P]lugin by [G]rep'
      },
      {
        "<C-f>",
        function() require('telescope.builtin').current_buffer_fuzzy_find({sorting_strategy='ascending', previewer = false, prompt_position='top'}) end,
        desc = 'Find in current buffer'
      },
      {
        '<leader>ff',
        function() require('telescope.builtin').find_files() end,
        desc = '[F]ind [F]iles'
      },
      {
        '<leader>fk',
        function() require('telescope.builtin').keymaps() end,
        desc = '[F]ind [K]ey'
      },
      {
        '<leader>fh',
        function() require('telescope.builtin').help_tags() end,
        desc = '[F]ind [H]elp'
      },
      {
        '<leader>fw',
        function() require('telescope.builtin').grep_string() end,
        desc = '[F]ind current [W]ord'
      },
      {
        '<leader>fg',
        function() require('telescope.builtin').live_grep() end,
        desc = '[F]ind by [G]rep'
      },
      {
        '<leader>fd',
        function ()require('telescope.builtin').diagnostics() end,
        desc = '[F]ind [D]iagnostics'
      },
      {
        '<leader><space>',
        function() require('telescope.builtin').buffers() end,
        desc = '[ ] Find existing buffers'
      }
    },
    -- change some options
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
        prompt_prefix = "$ ",
        mappings = {
          i = {
            ["<C-a>"] = function() print(vim.inspect(require('telescope.actions.state').get_selected_entry())) end,
            ['<C-u>'] = false,
            ['<C-d>'] = false,
          },
        },
      },
    },
  },

  --{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make', cond = vim.fn.executable 'make' == 1 },
  -- add telescope-fzf-native
  {
    "telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      config = function()
        require("telescope").load_extension("fzf")
      end,
    },
  },
}

