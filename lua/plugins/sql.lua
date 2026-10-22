-- Fixes for astrocommunity.pack.sql

---@type LazySpec
return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      autocmds = {
        -- the pack calls require("sqls").on_attach, which sqls.nvim removed in its
        -- vim.lsp.config rewrite (it now ships lsp/sqls.lua and its commands itself)
        sqls_attach = false,
      },
    },
  },
  { "nanotee/sqls.nvim", ft = "sql" },
  {
    "jay-babu/mason-null-ls.nvim",
    opts = function(_, opts)
      -- sqlfluff refuses to run without a dialect; default to postgres unless the
      -- project has its own sqlfluff config (which then picks the dialect)
      local function dialect_args(params)
        local root = vim.fs.root(params.bufname, { ".sqlfluff", "setup.cfg", "tox.ini", "pyproject.toml" })
        if root and vim.uv.fs_stat(root .. "/.sqlfluff") then return {} end
        return { "--dialect", "postgres" }
      end
      opts.handlers = opts.handlers or {}
      opts.handlers.sqlfluff = function()
        local null_ls = require "null-ls"
        null_ls.register(null_ls.builtins.diagnostics.sqlfluff.with { extra_args = dialect_args })
        null_ls.register(null_ls.builtins.formatting.sqlfluff.with { extra_args = dialect_args })
      end
    end,
  },
}
