return {
      "catppuccin/nvim",
      name = "catppuccin",
      priority = 1000,
      opts = {
        color_overrides = {
          mocha = {
            base = "#000000",
            mantle = "#000000",
            crust = "#000000",
          },
        },
      },
  -- optionally set the colorscheme within lazy config
  init = function()
    vim.cmd("colorscheme catppuccin")
  end
}
