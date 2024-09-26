return {
	"echasnovski/mini.nvim",

	config = function()
		require("mini.ai").setup({ n_lines = 500 })
		require("mini.surround").setup()
		require("mini.pairs").setup()
		require("mini.comment").setup()

		local statusline = require("mini.statusline")
		statusline.setup()
		statusline.section_location = function()
			return ""
		end
	end,
}
