-- Bicep (Azure) language server; there's no astrocommunity pack for it.
-- Mason's bicep-lsp wraps `dotnet Bicep.LangServer.dll`, so the .NET SDK must be installed.

---@type LazySpec
return {
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "bicep-lsp" })
    end,
  },
  {
    "AstroNvim/astrolsp",
    ---@type AstroLSPOpts
    opts = {
      config = {
        -- nvim-lspconfig ships no `cmd` for bicep
        bicep = { cmd = { "bicep-lsp" } },
      },
    },
  },
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      treesitter = { ensure_installed = { "bicep" } },
    },
  },
}
