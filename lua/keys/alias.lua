local map = vim.api.nvim_set_keymap

-- Normal mode keymap function
function nm(key, command)
  map('n', key, command, {noremap = true})
end

-- Input mode keymap function
function im(key, command)
  map('i', key, command, {noremap = true})
end

-- Visual mode keymap function
function vm(key, command)
  map('v', key, command, {noremap = true})
end

-- Terminal mode keymap function
function tm(key, command)
  map('t', key, command, {noremap = true})
end

vim.g.mapleader = ' '
