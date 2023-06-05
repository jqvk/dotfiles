local function set_keymap(...) vim.api.nvim_set_keymap(...) end

-- Mappings.
local opts = { noremap=true, silent=true }

-- See `:help vim.lsp.*` for documentation on any of the below functions
set_keymap('n', '<C-n>', '<cmd>NvimTreeToggle<CR>', opts)
set_keymap('n', '<leader>r', '<cmd>NvimTreeRefresh<CR>', opts)
set_keymap('n', '<leader>n', '<cmd>NvimTreeFindFile<CR>', opts)

require'nvim-tree'.setup{
  view = {
    width = 43,
    side = 'right'
  },
}
