return {
	{

		-- LSP Configuration & Plugins
		--
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		opts = {
			diagnostics = {
				float = {
					source = "always",
				},
				virtual_text = false,
			},
			servers = {
				ruff_lsp = {},
				lua_ls = {
					Lua = {
						format = { enable = false },
						workspace = { checkThirdParty = false },
						telemetry = { enable = false },
						diagnostics = { disable = { "missing-fields" } },
					},
				},
				rust_analyzer = {},
				jedi_language_server = {},
				gopls = {},
			},
		},
		config = function(_, opts)
			local mason_lspconfig = require("mason-lspconfig")

			mason_lspconfig.setup({
				ensure_installed = vim.tbl_keys(opts.servers),
			})

			mason_lspconfig.setup_handlers({
				function(server_name)
					require("lspconfig")[server_name].setup({
						settings = opts.servers[server_name],
					})
				end,
			})

			require("lspconfig").jedi_language_server.setup({
				init_options = {
					diagonstics = { enable = false },
				},
			})
		end,
	},
	{
		"williamboman/mason.nvim",
		cmd = "Mason",
		keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
		opts = {
			ensure_installed = {
				"lua_ls",
				"rust_analyzer",
				"jedi_language_server",
				"gopls",
				"ruff_lsp",
			},
		},
		-- config = function(_, opts)
		-- 	require("mason").setup(opts)
		-- 	local mr = require("mason-registry")
		-- 	local function ensure_installed()
		-- 		for _, tool in ipairs(opts.ensure_installed) do
		-- 			local p = mr.get_package(tool)
		-- 			if not p:is_installed() then
		-- 				p:install()
		-- 			end
		-- 		end
		-- 	end
		-- 	if mr.refresh then
		-- 		mr.refresh(ensure_installed)
		-- 	else
		-- 		ensure_installed()
		-- 	end
		-- end,
	},
}

-- return {
-- 	{
-- 		"williamboman/mason.nvim",
-- 		config = function()
-- 			require("mason").setup()
-- 		end,
-- 	},
-- 	{
-- 		"williamboman/mason-lspconfig.nvim",
-- 		config = function()
-- 			require("mason-lspconfig").setup({
-- 				ensure_installed = { "lua_ls", "rust_analyzer", "jedi_language_server", "gopls", "ruff_lsp" },
-- 			})
-- 		end,
-- 	},
-- 	{
-- 		"neovim/nvim-lspconfig",
-- 		config = function()
-- 			local lspconfig = require("lspconfig")
--
-- 			lspconfig.lua_ls.setup({})
-- 			-- lspconfig.pylsp.setup({})
-- 			lspconfig.jedi_language_server.setup({})
-- 			lspconfig.ruff_lsp.setup({})
-- 			lspconfig.rust_analyzer.setup({})
-- 			lspconfig.gopls.setup({})
--
-- 			-- vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
-- 			-- vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
-- 			-- vim.keymap.set({ "n" }, "<leader>ca", vim.lsp.buf.code_action, {})
-- 		end,
-- 	},
-- }
