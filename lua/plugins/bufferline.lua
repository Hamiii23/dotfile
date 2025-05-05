return {
  'romgrk/barbar.nvim',
  version = '^1.0.0',
  dependencies = {
    'lewis6991/gitsigns.nvim',
    'nvim-tree/nvim-web-devicons',
  },
  init = function()
    vim.g.barbar_auto_setup = false
  end,
  opts = {
    -- Add this block:
    sidebar_filetypes = {
      -- Prevent Barbar from overlapping with Neo-tree
      ["neo-tree"] = {
        event = "BufWinLeave", -- Or "BufEnter", depending on your preference
        text = "Neo-tree",
        align = "left", -- Text alignment
        separator = true,
      }
    },
  },
}
