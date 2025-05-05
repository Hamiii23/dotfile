-- options.lua

-- Create a shorthand for setting options
local opt = vim.opt

-- General
opt.backup = false           -- Don't create backup files
opt.writebackup = false      -- Don't allow backup files while editing
opt.swapfile = false         -- Don't use swap files
opt.undofile = true          -- Enable persistent undo
opt.hidden = true            -- Allow switching buffers without saving

-- Encoding
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

-- UI
opt.number = true             -- Show line numbers
opt.relativenumber = true     -- Relative line numbers
opt.cursorline = true         -- Highlight current line
opt.signcolumn = "yes"        -- Always show the sign column
opt.wrap = false              -- Don't wrap lines
opt.scrolloff = 8             -- Keep 8 lines above/below the cursor
opt.sidescrolloff = 8
opt.termguicolors = true      -- Enable 24-bit RGB colors
opt.fillchars:append("eob: ") -- Remove ~ from empty lines

-- Tabs and Indentation
opt.expandtab = true   -- Convert tabs to spaces
opt.shiftwidth = 2     -- Number of spaces for each indentation
opt.tabstop = 2        -- Number of spaces per tab
opt.smartindent = true -- Smart indentation

-- Search
opt.ignorecase = true -- Case-insensitive search...
opt.smartcase = true  -- ... unless capital letters are used
opt.incsearch = true  -- Show search matches as you type
opt.hlsearch = true   -- Highlight search results

-- Mouse
opt.mouse = "a" -- Enable mouse support

-- Clipboard
opt.clipboard = "unnamedplus" -- Use system clipboard

-- Splits
opt.splitbelow = true -- Horizontal splits go below
opt.splitright = true -- Vertical splits go to the right

-- Completion
opt.completeopt = { "menuone", "noselect" }

-- Performance
opt.updatetime = 300 -- Faster completion
opt.timeoutlen = 500 -- Time to wait for a mapped sequence

-- Misc
opt.iskeyword:append("-") -- Treat dash-separated words as a word
