return {
  "goolord/alpha-nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local alpha = require("alpha")
    local startify = require("alpha.themes.startify")

    -- Use devicons for file icons
    startify.file_icons = {
      enabled = true,
      provider = "devicons",
    }

    alpha.setup(startify.config)
  end,
  event = "VimEnter", -- Optional: only load on start
}
