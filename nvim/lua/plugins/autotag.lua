return {
  {
    "windwp/nvim-ts-autotag",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = function()
      require("nvim-ts-autotag").setup({
        filetypes = {
          "html", "javascript", "javascriptreact", "typescript", "typescriptreact",
        },
      })
    end
    -- ft = { "html", "javascriptreact", "typescriptreact" }, -- Only load for these filetypes
    -- opts = {},                                             -- No extra options needed
  },
}
