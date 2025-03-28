local M = {}

local vn = vim.fn


-- Clean directory
function M.clean_bin_dir(dir_path)
  os.execute("rm -f '" .. dir_path .. "'/*")
end


-- Save file if modified
function M.save_file()
  if vim.bo.modified then
    vim.cmd('write')
  end
end


-- Build Rust binary program in the project root (where Cargo.toml located)
-- Run the program, which is located in the /target/debug folder
-- TODO: Take care the library case
function M.build_and_run_rust_parent()
  M.save_file()

  local parent_dir = vn.expand('%:p:h:h')
  local binary_name = vn.fnamemodify(parent_dir, ':t')
  local binary_path = parent_dir .. '/target/debug/' .. binary_name
  
  vim.cmd('split | terminal cd ' .. 
          vn.shellescape(parent_dir) ..
          ' && cargo build && ' .. vn.shellescape(binary_path))

  vim.cmd('startinsert')
end


-- Build and run C++ program in the build folder of the project root
function M.build_and_run_cpp()
  M.save_file()

  local current_file = vn.expand('%:t:r')
  local parent_dir = vn.expand('%:p:h:h')
  local build_dir = parent_dir .. '/build'


  if vn.isdirectory(build_dir) == 0 then
    vim.notify('Creating build directory...', vim.log.levels.INFO)
    local success = os.execute('mkdir -p ' .. vn.shellescape(build_dir))

    if not success then
      vim.notify('Failed to create build directory', vim.log.levels.ERROR)
      return
    end
  end
  
  
  local makefile = build_dir .. '/Makefile'
  local cmake_cmd = ''
  if vn.filereadable(makefile) == 0 then
    cmake_cmd = 'cmake .. && '
  end


  local cmd = string.format(
    'cd %s && %smake && ./%s',
    vn.shellescape(build_dir),
    cmake_cmd,
    current_file
  )

  vim.cmd('split | terminal ' .. cmd)
  vim.cmd('startinsert')
  
end


return M
