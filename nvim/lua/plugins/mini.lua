return {
    "echasnovski/mini.nvim",

    config = function()
      -- Better Around/Inside textobjects
      --  - va)   - [V]isually select [A]round [)]parenthen
      --  - yinq - [Y]ank [I]nside [N]ext [']quote
      --  - ci'  - [C]hange [I]nside [']quote
      require("mini.ai").setup({ n_lines = 500 })

      -- Add/Delete/Replace surroundings (brackets, quotes, etc.)
      --  - saiw)  -  [S]urround [A]dd [I]nner [W]ord [)]Paren
      --  - sd'    -  [S]urround [D]elete [']quotes
      --  - sr)'   -  [S]urround [R]eplace [)] [']
      require("mini.surround").setup()
      require("mini.pairs").setup()
      require("mini.comment").setup()
      require("mini.icons").setup()

      -- local statusline = require("mini.statusline")
      -- statusline.setup()
      -- statusline.section_location = function()
      --         return ""
      -- end
    end,
}
