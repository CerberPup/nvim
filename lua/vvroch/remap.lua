local nnoremap = require("vvroch.keymap").nnoremap
local inoremap = require("vvroch.keymap").inoremap
local vnoremap = require("vvroch.keymap").vnoremap

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- delete without yanking
nnoremap('<leader>d', '"_d', { desc = 'Delete without yank'})
vnoremap('<leader>d', '"_d', { desc = 'Delete without yank'})

-- replace currently selected text with default register
-- without yanking it
vnoremap('p','"_dp', { desc = 'Paste without yank'})
vnoremap('P','"_dP', { desc = 'Paste without yank'})

inoremap("jk", "<esc>", {desc = 'Escape to from insert'})
vnoremap("<C-c>", "\"*y<CR>", {desc = 'Yank to system clipboard'})

-- nnoremap("<leader>h", ":wincmd h<CR>")
-- nnoremap("<leader>j", ":wincmd j<CR>")
-- nnoremap("<leader>k", ":wincmd k<CR>")
-- nnoremap("<leader>l", ":wincmd l<CR>")

nnoremap("<leader>u", ":UndotreeToggle<CR>")

--nnoremap('<leader>c', ':wa <bar> :set makeprg=cd\\ build\\ &&\\ cmake\\ -DCMAKE_BUILD_TYPE=debug\\ -DCMAKE_EXPORT_COMPILE_COMMANDS=1\\ ../src\\ &&\\ cmake\\ --build\\ . <bar> :compiler gcc <bar> :make <CR>')
local wk = require("which-key")
wk.register({
  ["<leader>f"] = { name = "+Find" },
  ["<leader>c"] = { name = "+Code" },
})
