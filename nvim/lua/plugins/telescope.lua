return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = {"nvim-lua/plenary.nvim"},
  keys = {
    {"<leader>ff", ":Telescope find_files<CR>", desc="Find files"},
    {"<leader>fg", ":Telescope live_grep<CR>", desc="Live grep"},
    {"<leader>fb", ":Telescope buffers<CR>", desc="Buffers"},
  },
}
