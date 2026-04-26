---@type LazySpec
return {
  "mrcjkb/rustaceanvim",
  ---@param opts table
  opts = function(_, opts)
    local server = opts.server or {}
    local prev_on_attach = server.on_attach
    server.on_attach = function(client, bufnr)
      require("astrolsp").on_attach(client, bufnr)
      if type(prev_on_attach) == "function" then prev_on_attach(client, bufnr) end
    end
    opts.server = server
  end,
}
