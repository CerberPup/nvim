return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "neovim/nvim-lspconfig",
		"https://gitlab.com/schrieveslaach/sonarlint.nvim.git",
	},
		config = function()
			-- LSP settings.
			-- This function gets run when an LSP connects to a particular buffer.
			local on_attach = function(_, bufnr)
				-- NOTE: Remember that lua is a real programming language, and as such it is possible
				-- to define small helper and utility functions so you don't have to repeat yourself
				-- many times.
				-- In this case, we create a function that lets us more easily define mappings specific
				-- for LSP related items. It sets the mode, buffer and description for us each time.
				local nmap = function(keys, func, desc)
					if desc then
						desc = "LSP: " .. desc
					end

					vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
				end
				nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
				nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

				nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
				nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
				nmap("gI", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
				nmap("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")
				nmap("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
				nmap("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

				-- See `:help K` for why this keymap
				nmap("K", vim.lsp.buf.hover, "Hover Documentation")
				nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")

				-- Lesser used LSP functionality
				nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
				nmap("<leader>wa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder")
				nmap("<leader>wr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder")
				nmap("<leader>wl", function()
					print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
				end, "[W]orkspace [L]ist Folders")

				-- Create a command `:Format` local to the LSP buffer
				vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
					vim.lsp.buf.format()
				end, { desc = "Format current buffer with LSP" })
			end

			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
			vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
			vim.keymap.set("n", "<leader>cdf", vim.diagnostic.open_float, { desc = "[C]ode [D]iagnostic [F]loat" })
			vim.keymap.set("n", "<leader>cdl", vim.diagnostic.setloclist, { desc = "[C]ode [D]iagnostic [L]ist" })
			local servers = {
				clangd = {},
				gopls = {},
				pyright = {},
				-- rust_analyzer = {},
				-- tsserver = {},
				lua_ls = {},
			}
			require("mason-lspconfig").setup({
				ensure_installed = { "ast_grep" },
				-- ensure_installed = vim.tbl_keys(servers),
			})

			-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

			function register_server(server_name)
				require("lspconfig")[server_name].setup({
					capabilities = capabilities,
					on_attach = function(_, bufnr)
						if server_name == "clangd" then
							local glob = vim.fn.glob(vim.fn.getcwd() .. "/src/main.cpp", true, true)
							if next(glob) ~= nil then
								vim.api.nvim_create_autocmd("BufWritePost", {
									pattern = { "*.cpp", "*.h" },
									command = ":!" .. vim.fn.stdpath("config") .. "/scripts/build.sh",
								})
							end
						end
						return on_attach(_, bufnr)
					end,
					settings = servers[server_name],
				})
			end

			if vim.fn.executable("clangd") == 1 then
				register_server("clangd") --force clangd for raspberrypi
			end
			require("mason-lspconfig").setup_handlers({
				register_server,
			})
			require("sonarlint").setup({
				server = {
					cmd = {
						"sonarlint-language-server",
						-- Ensure that sonarlint-language-server uses stdio channel
						"-stdio",
						"-analyzers",
						-- paths to the analyzers you need, using those for python and c in this example
						vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarpython.jar"),
						vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarcfamily.jar"),
						vim.fn.expand("$MASON/share/sonarlint-analyzers/sonargo.jar"),
						-- vim.fn.expand("$MASON/share/sonarlint-analyzers/sonariac.jar"), -- docker (Infrastructure as code)
					},
				},
				filetypes = {
					-- Tested and working
					"python",
					"cpp",
					"go"
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			-- Useful status updates for LSP
			"j-hui/fidget.nvim",
		},
		config = function()
			-- local capabilities = require("cmp_nvim_lsp").default_capabilities()
			-- local lspconfig = require("lspconfig")
			-- lspconfig.lua_ls.setup({})
			-- vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "LSP: Hover Documentation" })
		end,
	},
}
