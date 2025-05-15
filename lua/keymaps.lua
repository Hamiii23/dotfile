-- Defining leader key
vim.g.mapleader = " "

-- Define a shortcut for keymapping
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Basic keymaps
map("n", "<leader>w", ":w<CR>", opts)          -- Save file
map("n", "<leader>q", ":q<CR>", opts)          -- Quit
map("n", "<Esc>", "<cmd>nohlsearch<CR>", opts) -- Clear search highlight

-- Window navigation
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)
map("n", "<leader>bd", ":bw<CR>", opts) -- Close window


map("n", "<leader>cm", "<cmd>Mason<CR>", opts) -- Toggle explorer
map("n", "<leader>l", "<cmd>Lazy<CR>", opts) -- Toggle explorer

-- Resize splits with arrow keys
map("n", "<C-Left>", ":vertical resize -2<CR>", opts)
map("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Buffer navigation
map("n", "<S-l>", ":bnext<CR>", opts)
map("n", "<S-h>", ":bprevious<CR>", opts)

-- Move lines up and down
map("n", "<A-j>", ":m .+1<CR>==", opts)
map("n", "<A-k>", ":m .-2<CR>==", opts)
map("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
map("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)

-- Telescope keymaps
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", opts)
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", opts)
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", opts)
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", opts)

-- Neo-tree keymaps
map("n", "<leader>e", "<cmd>Neotree toggle<CR>", opts) -- Toggle explorer
map("n", "<leader>o", "<cmd>Neotree focus<CR>", opts)  -- Focus explorer

-- Diagnostics
map("n", "<leader>dd", vim.diagnostic.open_float, opts)
map("n", "[d", vim.diagnostic.goto_prev, opts)
map("n", "]d", vim.diagnostic.goto_next, opts)

--Toggleterm

map("n", "<leader>tt", "<cmd>ToggleTerm<CR>", { desc = "Toggle Terminal", noremap = true, silent = true })
map("n", "<leader>tv", "<cmd>ToggleTerm direction=vertical size=40<CR>", { desc = "Vertical Terminal" })
map("n", "<leader>tf", "<cmd>ToggleTerm direction=float<CR>", { desc = "Floating Terminal" })
map("n", "<leader>tg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", { desc = "Toggle Lazygit" })
