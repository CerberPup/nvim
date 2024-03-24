-- vim.opt.guicursor = "guicursor=n-v-c:block"
vim.opt.cursorline = true
vim.opt.ma = true
vim.opt.mouse = 'a'

-- Enable break indent
vim.o.breakindent = true

-- Make line numbers default
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.errorbells = false

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- vim.opt.smartindent = true

vim.opt.autoread = true

vim.opt.wrap = false
vim.opt.foldlevelstart = 99

-- Case insensitive searching UNLESS /C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- files + undodir
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = vim.fn.expand("~/.vim/undodir")
vim.opt.undofile = true

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.scrolloff = 8
--vim.opt.signcolumn = "yes"
--vim.opt.isfname:append("@-@")

-- Give more space for displaying messages.
vim.opt.cmdheight = 0
vim.api.nvim_create_autocmd({ "RecordingEnter" }, {
  callback = function()
               vim.opt.cmdheight = 1
             end,
})
vim.api.nvim_create_autocmd({ "RecordingLeave" }, {
  callback = function()
               vim.opt.cmdheight = 0
             end,
})

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
-- Decrease update time
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

vim.opt.signcolumn = 'yes'

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Don't pass messages to |ins-completion-menu|.
-- vim.opt.shortmess:append("c")

-- vim.opt.colorcolumn = "80"

-- remove status at bottom - --insert-- --replace--
vim.o.showmode = false

vim.o.termguicolors = true

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- [[ Basic Keymaps ]]
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.opt.clipboard = 'unnamedplus'

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})
