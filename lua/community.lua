-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.rust" },
  { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.pack.tailwindcss" },
  -- python: basedpyright for types, ruff for lint/imports/format (instead of the pack's black + isort)
  { import = "astrocommunity.pack.python.base" },
  { import = "astrocommunity.pack.python.basedpyright" },
  { import = "astrocommunity.pack.python.ruff" },
  { import = "astrocommunity.pack.go" },
  { import = "astrocommunity.pack.cpp" },
  { import = "astrocommunity.pack.astro" },
  { import = "astrocommunity.pack.yaml" },
  { import = "astrocommunity.pack.docker" },
  { import = "astrocommunity.pack.terraform" },
  { import = "astrocommunity.pack.bash" },
  { import = "astrocommunity.pack.sql" },
  { import = "astrocommunity.pack.markdown" },
  { import = "astrocommunity.pack.mdx" },
  { import = "astrocommunity.test.neotest" },
  { import = "astrocommunity.markdown-and-latex.vimtex" },
  { import = "astrocommunity.markdown-and-latex.texpresso-vim" },
  { import = "astrocommunity.completion.cmp-latex-symbols" },
  -- import/override with your plugins folder
}
