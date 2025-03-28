
local M = {}
local helpers = require('custom.my_helpers')

-- function M.set_telescope_keys()
--   keymap.set(
--             "n",
--             "<leader>ff",
--             builtin.find_files,
--             {desc = "Telescope find files"}
--             )
--
--   keymap.set(
--             "n",
--             "<leader>fg",
--             builtin.live_grep,
--             {desc = "Telescope live grep"}
--             )
--
--   keymap.set(
--             "n",
--             "<leader>fb",
--             builtin.buffers,
--             {desc = "Telescope buffers"}
--             )
--
--   keymap.set(
--             "n",
--             "<leader>fh",
--             builtin.help_tags,
--             {desc = "Telescope help tags"}
--             )
-- end

function M.setup()
	local keymap = vim.keymap
	local vn = vim.fn

  keymap.set("i", "jk", "<ESC>")

  -- keymap.set("v", "J", ":m '>+1<CR>gv=gv")
  -- keymap.set("v", "K", ":m '<-2<CR>gv=gv")

  -- keymap.set("n", "<leader>sv", "<C-w>v")
  -- keymap.set("n", "<leader>sh", "<C-w>s")
  keymap.set("n",
            "<leader>nh",
            ":nohl<CR>",
            {desc = "No highlight"}
            )

  keymap.set("n",
            "<leader>w",
            ":w<CR>",
            {desc = "Write", noremap = true}
            )
  
  keymap.set("n", "<leader>r",
    function()
        local file = vn.expand('%:p') -- Absolute path
        if file == '' then
          vim.notify("Error: No filename detected (save the file first)", vim.log.levels.ERROR)
          return
        end

        local file_extension = vn.expand("%:e")

        if file_extension == "cpp" then
          helpers.build_and_run_cpp()
        elseif file_extension == 'py' then
          vim.cmd('split | terminal python3 "' .. file .. '"')
          vim.cmd('startinsert')
          
        elseif file_extension == 'rs' then
          helpers.build_and_run_rust_parent()
        end

    end,
    {silent=true}
  )
end


return M
