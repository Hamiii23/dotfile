return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    -- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window
  },
  lazy = false,
  opts = {
    filesystem = {
      bind_to_cwd = true, -- automatically follow the CWD
      follow_current_file = {
        enabled = true,    -- follow current file in the tree
        leave_dirs_open = false,
      },
      use_libuv_file_watcher = true, -- auto refresh
    },
    default_component_configs = {
      indent = {
        with_markers = true,
        indent_size = 2,
      },
    },
    window = {
      position = "left",
      width = 30,
    },
  },
}
