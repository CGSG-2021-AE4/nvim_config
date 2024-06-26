require('keys/alias')

-- Nvim tree 
nm('<leader>n', '<cmd>NvimTreeToggle<cr>')
nm('<leader>e', '<cmd>NvimTreeFocus<cr>')

-- Bufferline
nm('<Tab>', '<cmd>BufferLineCycleNext<cr>')
nm('<S-Tab>', '<cmd>BufferLineCyclePrev<cr>')

-- Window movements
nm('<C-h>', '<C-w>h')
nm('<C-j>', '<C-w>j')
nm('<C-k>', '<C-w>k')
nm('<C-l>', '<C-w>l')

-- Closing the buffer
nm('<leader>x', '<cmd>Bdelete<CR>')

-- Telescope
-- local tBuiltin = require('telescope.builtin')
nm('<leader>ff', '<cmd>lua require("telescope.builtin").find_files()<cr>')
nm('<leader>fg', '<cmd>lua require("telescope.builtin").live_grep()<cr>')
nm('<leader>fb', '<cmd>lua require("telescope.builtin").buffers()<cr>')
nm('<leader>fh', '<cmd>lua require("telescope.builtin").help_tags()<cr>')

-- Some LSP bindings
-- CMake
nm('<leader>cg', '<cmd>CMake configure<cr>')
nm('<leader>cb', '<cmd>CMake build_all<cr>')
nm('<leader>cs', '<cmd>CMake select_target<cr>')
nm('<leader>cr', '<cmd>CMake run<cr>')
-- Rust
nm('<leader>rr', '<cmd>RustRun<cr>')
-- nm('<leader>cc', '<cmd>CMakeClose<cr>')
-- nm('<leader>co', '<cmd>CMakeOpen<cr>')
-- nm('<leader>cr', '<cmd>CMakeRun')
