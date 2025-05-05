return {
  {
    "williamboman/mason.nvim",
    config = true,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          -- "lua_ls", -- ✨ Commented out to prevent broken install on NixOS
          "vtsls",
          "gopls",
          -- nixd is installed via Nix, so we don't need mason to install it
        },
        automatic_installation = true,
        handlers = {
          -- ⛔ Prevent mason from setting up lua_ls and nixd
          lua_ls = function() end,
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-nvim-lsp",
      "L3MON4D3/LuaSnip",
    },
    config = function()
      -- 🔁 Custom diagnostic signs
      local signs = { Error = " ", Warn = " ", Hint = "󰌵", Info = " " }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
      end

      local lspconfig = require("lspconfig")

      -- Add capabilities for nvim-cmp with snippet support
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.completion.completionItem.snippetSupport = true
      capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

      -- Setup vtsls from mason
      lspconfig.vtsls.setup({
        capabilities = capabilities,
      })

      -- Setup gopls from mason
      lspconfig.gopls.setup({
        capabilities = capabilities,
        settings = {
          gopls = {
            usePlaceholders = true,
            completeUnimported = true,
            analyses = {
              unusedparams = true,
              unreachable = true,
            },
          },
        },
      })

      -- Setup lua_ls from Nix-installed binary
      lspconfig.lua_ls.setup({
        cmd = { "/run/current-system/sw/bin/lua-language-server" },
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
          },
        },
      })

      -- Setup nixd from Nix-installed binary
      lspconfig.nixd.setup({
        cmd = { "/run/current-system/sw/bin/nixd" },
        capabilities = capabilities,
      })
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        sources = {
          { name = "nvim_lsp" },
          { name = "luasnip" },
        },
      })
    end,
  },
}
