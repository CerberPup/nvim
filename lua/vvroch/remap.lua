-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set({ 'n', 'v' }, 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set({ 'n', 'v' }, 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- delete without yanking
vim.keymap.set('n', '<leader>d', '"_d', { desc = 'Delete without yank'})
vim.keymap.set('v', '<leader>d', '"_d', { desc = 'Delete without yank'})

-- replace currently selected text with default register
-- without yanking it
vim.keymap.set('v', 'p','"_dp', { desc = 'Paste without yank'})
vim.keymap.set('v', 'P','"_dP', { desc = 'Paste without yank'})

vim.keymap.set('i', "jk", "<esc>", {desc = 'Escape to from insert'})
vim.keymap.set('v', "<C-c>", "\"*y<CR>", {desc = 'Yank to system clipboard'})

-- clear search after esc
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- vim.keymap.set('n', "<leader>h", ":wincmd h<CR>")
-- vim.keymap.set('n', "<leader>j", ":wincmd j<CR>")
-- vim.keymap.set('n', "<leader>k", ":wincmd k<CR>")
-- vim.keymap.set('n', "<leader>l", ":wincmd l<CR>")

--vim.keymap.set('n', '<leader>c', ':wa <bar> :set makeprg=cd\\ build\\ &&\\ cmake\\ -DCMAKE_BUILD_TYPE=debug\\ -DCMAKE_EXPORT_COMPILE_COMMANDS=1\\ ../src\\ &&\\ cmake\\ --build\\ . <bar> :compiler gcc <bar> :make <CR>')
