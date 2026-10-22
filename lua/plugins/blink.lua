---@type LazySpec
return {
  "saghen/blink.cmp",
  opts = function(_, opts)
    -- astrocommunity's cmp-latex-symbols adds the `latex` source to every filetype;
    -- only offer LaTeX symbol completions where they make sense
    opts.sources.default = vim.tbl_filter(function(source) return source ~= "latex" end, opts.sources.default)
    opts.sources.per_filetype = opts.sources.per_filetype or {}
    for _, ft in ipairs { "tex", "plaintex", "markdown" } do
      opts.sources.per_filetype[ft] = { "latex", inherit_defaults = true }
    end
  end,
}
