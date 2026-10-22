-- mdx_analyzer needs a TypeScript lib; outside a Node project there is no
-- node_modules/typescript, so fall back to the copy bundled with vtsls

---@type LazySpec
return {
  "AstroNvim/astrolsp",
  ---@type AstroLSPOpts
  opts = {
    config = {
      mdx_analyzer = {
        -- astrocommunity.pack.mdx sets .mdx files to `markdown.mdx`, but lspconfig only matches `mdx`
        filetypes = { "markdown.mdx", "mdx" },
        before_init = function(params, config)
          local tsdk = require("lspconfig.util").get_typescript_server_path(config.root_dir)
          if tsdk == "" then
            tsdk = vim.fn.expand "$MASON/packages/vtsls/node_modules/@vtsls/language-server/node_modules/typescript/lib"
          end
          -- the initialize params are already built from init_options, so update them directly
          params.initializationOptions = vim.tbl_deep_extend(
            "force",
            params.initializationOptions or config.init_options or {},
            { typescript = { tsdk = tsdk } }
          )
        end,
      },
    },
  },
}
