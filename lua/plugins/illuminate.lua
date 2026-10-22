-- vim-illuminate's treesitter provider calls nvim-treesitter (master) locals,
-- which breaks on Neovim 0.12 ("attempt to call method 'parent'").
-- Upstream dropped treesitter from the default providers; mirror that here.

---@type LazySpec
return {
  "RRethy/vim-illuminate",
  opts = {
    providers = { "lsp", "regex" },
  },
}
