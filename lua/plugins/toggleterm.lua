return {
  'akinsho/toggleterm.nvim',
  version = "*",
  opts = {
    size = 15,
    open_mapping = [[<C-/>]],  -- Ctrl + /
    hide_numbers = true,
    shade_terminals = true,
    shading_factor = 2,
    start_in_insert = true,
    insert_mappings = true,
    terminal_mappings = true,
    persist_size = true,
    direction = 'horizontal',
    close_on_exit = true,
    shell = vim.o.shell,
  },
  config = function(_, opts)
    require("toggleterm").setup(opts)

    -- Setup lazygit terminal
    local Terminal = require("toggleterm.terminal").Terminal
    local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })

    function _LAZYGIT_TOGGLE()
      lazygit:toggle()
    end

    -- Keymaps
    vim.keymap.set("n", "<leader>tt", "<cmd>ToggleTerm<CR>", { desc = "Toggle Terminal", noremap = true, silent = true })
    vim.keymap.set("n", "<leader>tv", "<cmd>ToggleTerm direction=vertical size=40<CR>", { desc = "Vertical Terminal" })
    vim.keymap.set("n", "<leader>tf", "<cmd>ToggleTerm direction=float<CR>", { desc = "Floating Terminal" })
    vim.keymap.set("n", "<leader>tg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", { desc = "Toggle Lazygit" })
  end
}
