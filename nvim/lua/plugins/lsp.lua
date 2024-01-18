return {
  {
    "neovim/nvim-lspconfig",
    config = function(_, opts)
      lsp = require("lspconfig")
      lsp.dartls.setup{}
      lsp.biome.setup{}
      lsp.gopls.setup{}
      -- lsp.tsserver.setup{}
      lsp.volar.setup{
        filetypes = {'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json'}
      }
      lsp.pylsp.setup{}
      lsp.pyright.setup{}
      lsp.postgres_lsp.setup{}
      lsp.tailwindcss.setup{}
      lsp.bufls.setup{}
      lsp.vls.setup{}
    end,
  },
}
