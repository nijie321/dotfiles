return {
	"stevearc/conform.nvim",
	opts = {
		notify_on_error = false,
		format_on_save = {},
	},
	config = function()
		local conform = require("conform")

		conform.setup({
			format_on_save = {
				timeout_ms = 500,
				lsp_fallback = true,
			},

			notify_on_error = false,
			formatters_by_ft = {

				lua = { "stylua" },
				python = {},
				rust = { "rustfmt", lsp_format = "fallback" },
			},
		})
	end,
}
