local M = {}

function M.setup()

  local opt = vim.opt

  opt.relativenumber = true
  opt.number = true

  opt.tabstop = 2
  opt.shiftwidth = 2
  opt.expandtab = true
  opt.autoindent = true

  opt.wrap = false

  opt.splitright = true
  opt.splitbelow = true


  opt.ignorecase = true
  opt.smartcase = true


  opt.termguicolors = true
  opt.signcolumn = "yes"
end

return M
