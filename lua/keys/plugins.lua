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
nm('<leader>x', '<cmd>bprevious<bar>bd #<CR>')
