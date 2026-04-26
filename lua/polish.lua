-- if true then return end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- This will run last in the setup process and is a good place to configure
-- things like custom filetypes. This is just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

-- Set up custom filetypes
vim.filetype.add {
  extension = {
    foo = "fooscript",
    mdx = "mdx",
    log = "log",
    conf = "conf",
    env = "dotenv",
  },
  filename = {
    ["Foofile"] = "fooscript",
    [".env"] = "dotenv",
    ["env"] = "dotenv",
    ["tsconfig.json"] = "jsonc",
  },
  pattern = {
    ["~/%.config/foo/.*"] = "fooscript",
    ["%.env%.[%w_.-]+"] = "dotenv",
  },
}
