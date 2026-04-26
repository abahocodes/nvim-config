return {
  "greggh/claude-code.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require("claude-code").setup {
      window = {
        position = "botright",
        split_ratio = 0.3,
        enter_insert = true,
      },
      keymaps = {
        toggle = {
          normal = "<leader>ac",
          terminal = "<leader>ac",
        },
      },
    }
  end,
}
