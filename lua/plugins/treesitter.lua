-- Customize Treesitter
-- --------------------
-- Treesitter customizations are handled with AstroCore
-- as nvim-treesitter simply provides a download utility for parsers

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    treesitter = {
      -- treesitter highlighting everywhere except LaTeX, where vimtex's syntax engine is required
      -- for math zones and concealment (astrocommunity's vimtex pack still disables it via the
      -- pre-v6 nvim-treesitter module option, which no longer has any effect)
      highlight = function(lang) return lang ~= "latex" end,
      indent = true, -- enable/disable treesitter based indentation
      auto_install = true, -- enable/disable automatic installation of detected languages
      ensure_installed = {
        "lua",
        "vim",
        -- language packs in `community.lua` install their own parsers (rust, typescript, toml, json, ...)
      },
    },
  },
}
