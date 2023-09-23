-- Aesthetic
-- pcall catches errors if the plugin doesn't load
--local ok, catppuccin = pcall(require, "catppuccin")
--if not ok then return end
--catppuccin.setup {}

-- require'nvim-treesitter.configs'.setup { ensure_installed = "all", highlight = { enable = true } }


-- organize imports
-- https://github.com/neovim/nvim-lspconfig/issues/115#issuecomment-902680058
-- function OrganizeImports(timeoutms)
-- 	local params = vim.lsp.util.make_range_params()
-- 	params.context = { only = { "source.organizeImports" } }
-- 	local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, timeoutms)
-- 	for _, res in pairs(result or {}) do
-- 		for _, r in pairs(res.result or {}) do
-- 			if r.edit then
-- 				vim.lsp.util.apply_workspace_edit(r.edit, "UTF-8")
-- 			else
-- 				vim.lsp.buf.execute_command(r.command)
-- 			end
-- 		end
-- 	end
-- end

-- Enable Comment.nvim
require('Comment').setup()

require('indent_blankline').setup {
  char = '┊',
  show_trailing_blankline_indent = false,
}



-- See `:help telescope.builtin`
-- vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })


local cfg = {
toggle_key='<C-s>'
}
require "lsp_signature".setup(cfg)

vim.diagnostic.config({
  virtual_text = false,
})
