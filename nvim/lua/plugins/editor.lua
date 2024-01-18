return {
  {
    "rmagatti/auto-session",
    config = function()
      require("auto-session").setup({})
    end,
  },
  {
    "ibhagwan/fzf-lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      winopts = {
        width = 0.95,
        -- preview = { delay = 50 },
      },
      files = { cmd = 'fdfind --type file' },
      grep = {
        rg_opts = "--column --line-number --no-heading --color=always --smart-case --max-columns=512 -g '!*lock*'",
      }
    },
    config = function(_, opts)
      local function set_keymap(...) vim.api.nvim_set_keymap(...) end
      local opt = { noremap=true, silent=true }
      -- Files and buffers
      set_keymap('n', 'ff', '<cmd>FzfLua files<CR>', opt)
      set_keymap('n', 'fj', '<cmd>FzfLua live_grep<CR>', opt)
      set_keymap('n', 'fh', '<cmd>FzfLua live_grep_resume<CR>', opt)
      set_keymap('n', 'fb', '<cmd>FzfLua buffers<CR>', opt)
      set_keymap('n', 'fg', '<cmd>FzfLua git_status<CR>', opt)
      set_keymap('n', 'fr', '<cmd>FzfLua resume<CR>', opt)
      -- LSP
      set_keymap('n', 'gd', '<cmd>FzfLua lsp_definitions<CR>', opt)
      set_keymap('n', 'gr', '<cmd>FzfLua lsp_references<CR>', opt)
      set_keymap('n', 'gt', '<cmd>FzfLua lsp_typedefs<CR>', opt)
      set_keymap('n', 'gi', '<cmd>FzfLua lsp_implementations<CR>', opt)
      require("fzf-lua").setup(opts)
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      highlight = { enable = true },
      ensure_installed = { "go", "typescript", "tsx", "javascript", "json", "dart", "html", "htmldjango", "sql", "v", "vue", "svelte", "lua" },
      autoinstall = true,
      sync_install = false,
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  {
    "stevearc/dressing.nvim",
    config = function()
      require("dressing").setup()
    end,
  },
}
