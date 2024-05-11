local Path = require('plenary.path')
-- vim.g.cmake_build_dir_location = 'out/'
-- vim.g.cmake_generate_options = { "-DCMAKE_EXPORT_COMPILE_COMMANDS=1 -G Ninja" }
require('cmake').setup({
  build_dir = tostring(Path:new('{cwd}', 'build', '{build_type}')),
  configure_args = { '-D', 'CMAKE_EXPORT_COMPILE_COMMANDS=1', '-G', 'Ninja' },
  -- copy_compile_commands = false,
})