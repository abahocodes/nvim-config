---@type LazySpec
return {
  "greggh/claude-code.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  cmd = { "ClaudeCode", "ClaudeCodeContinue", "ClaudeCodeResume", "ClaudeCodeVerbose" },
  keys = { { "<Leader>ac", desc = "Claude Code: Toggle" } },
  opts = {
    window = {
      position = "botright",
      split_ratio = 0.3,
      enter_insert = true,
    },
    keymaps = {
      toggle = {
        normal = "<Leader>ac",
        -- a non-printing key so typing " ac" in the Claude prompt doesn't toggle the window
        terminal = "<C-,>",
      },
    },
  },
}
