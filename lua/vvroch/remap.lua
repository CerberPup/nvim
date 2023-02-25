local nnoremap = require("vvroch.keymap").nnoremap
local inoremap = require("vvroch.keymap").inoremap
local vnoremap = require("vvroch.keymap").vnoremap

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

inoremap("jk", "<esc>", {desc = 'Escape to from insert'})
vnoremap("<C-c>", "\"*y<CR>", {desc = 'Yank to system clipboard'})

nnoremap("<leader>h", ":wincmd h<CR>")
nnoremap("<leader>j", ":wincmd j<CR>")
nnoremap("<leader>k", ":wincmd k<CR>")
nnoremap("<leader>l", ":wincmd l<CR>")

nnoremap("<leader>u", ":UndotreeToggle<CR>")

nnoremap("<leader>lf", ":lua vim.lsp.buf.code_action()")
nnoremap("<C-f>", ":lua require('telescope.builtin').current_buffer_fuzzy_find({sorting_strategy='ascending', prompt_position='top'})<CR>")
-- nnoremap("<C-f>", ":Telescope current_buffer_fuzzy_find sorting_strategy=ascending prompt_position=top<CR>")
-- nnoremap("<leader>f", require('telescope.builtin'), { desc = 'Telescope'})
nnoremap('<leader>ff', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
nnoremap('<leader>fh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
nnoremap('<leader>fw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
nnoremap('<leader>fg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
nnoremap('<leader>fd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
