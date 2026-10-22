-- LaTeX formatting with latexindent, run through none-ls so it follows the
-- one-formatter-per-buffer rule in astrolsp.lua (none-ls has no builtin for it)

---@type LazySpec
return {
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "latexindent" })
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    opts = function(_, opts)
      local h = require "null-ls.helpers"
      local latexindent = h.make_builtin {
        name = "latexindent",
        method = require("null-ls.methods").internal.FORMATTING,
        filetypes = { "tex", "plaintex", "bib" },
        generator_opts = {
          command = "latexindent",
          -- read stdin, write stdout, and keep indent.log out of the project directory
          args = { "--logfile=/dev/null", "-" },
          to_stdin = true,
        },
        factory = h.formatter_factory,
      }
      opts.sources = require("astrocore").list_insert_unique(opts.sources, { latexindent })
    end,
  },
}
