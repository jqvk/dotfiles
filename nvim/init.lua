-- general config
vim.g.filetype_v = "v"
vim.o.number = true
vim.o.relativenumber = true
vim.o.scrolloff = 4
vim.o.visualbell = true
vim.o.encoding = 'utf-8'
vim.o.expandtab = false
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.number = true
vim.o.termguicolors = true
vim.g.mapleader = ' '
vim.o.smartindent = true
vim.o.hidden = true
vim.o.showmode = false
vim.o.signcolumn = "yes"
vim.cmd([[
  nnoremap Y y$
  nnoremap j gj
  nnoremap k gk
  nnoremap <leader>l <C-w>l
  nnoremap <leader>h <C-w>h
  nnoremap <leader>j <C-w>j
  nnoremap <leader>k <C-w>k
]])

-- Install lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
--  Load plugins
require("lazy").setup("plugins")

vim.api.nvim_create_autocmd({'BufNewFile', 'BufRead'}, {
  pattern = {"*.v"},
  callback = function(ev)
    vim.cmd([[set filetype=v]])
  end,
})

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local opts = { buffer = args.buf }
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>ee", vim.diagnostic.open_float, opts)
    vim.keymap.set("n", "<leader>ef", vim.lsp.buf.format, opts)
    vim.keymap.set("n", "<leader>ed", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "<leader>ea", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<leader>eR", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>er", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "<leader>ei", vim.lsp.buf.implementation, opts)
  end,
})

-- Statusline
require("statusline")
