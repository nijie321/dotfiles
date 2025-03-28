return {
  "EdenEast/nightfox.nvim",
  name = "nordfox",
  lazy = false,
  priority = 1000,
  -- opts = {
  --   terminal_colors = true,
  --   styles = {
  --     comments = "italic",
  --     keywords = "bold",
  --     types = "italic,bold",
  --   },
  -- },
  config = function()
    vim.cmd([[colorscheme carbonfox]])
  end,
}
