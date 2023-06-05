-- if vim.g.vscode then
  -- print("vscode")
-- else
  require("kevv")
  require("github-theme").setup({
    theme_style = "dark_default",
  })
-- end
vim.o.clipboard = "unnamedplus";
