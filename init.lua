-- This file simply bootstraps the installation of Lazy.nvim and then calls other files for execution
-- This file doesn't necessarily need to be touched, BE CAUTIOUS editing this file and proceed at your own risk.
local lazypath = vim.env.LAZY or vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not (vim.env.LAZY or (vim.uv or vim.loop).fs_stat(lazypath)) then
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- validate that lazy is available
if not pcall(require, "lazy") then
  -- stylua: ignore
  vim.api.nvim_echo({ { ("Unable to load lazy from: %s\n"):format(lazypath), "ErrorMsg" }, { "Press any key to exit...", "MoreMsg" } }, true, {})
  vim.fn.getchar()
  vim.cmd.quit()
end

-- Shim: Neovim 0.12 renamed _request_name_to_capability → _request_name_to_server_capability
-- none-ls.nvim still reads the old name. Alias it so none-ls works on any Neovim version.
if not vim.lsp.protocol._request_name_to_capability and vim.lsp.protocol._request_name_to_server_capability then
  vim.lsp.protocol._request_name_to_capability = vim.lsp.protocol._request_name_to_server_capability
end

require "lazy_setup"
require "polish"
