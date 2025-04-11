return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",     -- LSP completions
      "hrsh7th/cmp-buffer",       -- Buffer words
      "hrsh7th/cmp-path",         -- Filesystem paths
      "saadparwaiz1/cmp_luasnip", -- Snippet completions
      "onsails/lspkind.nvim",     -- Icons in completion menu
    },
    opts = function(_, opts)
      local cmp = require("cmp")
      local lspkind = require("lspkind")

      -- Override default options
      opts.sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
      })

      -- Enable icons in completion menu
      opts.formatting = {
        format = lspkind.cmp_format({
          mode = "symbol_text",
          maxwidth = 50,
          ellipsis_char = "...",
        })
      }

      -- Super-Tab like behavior
      opts.mapping = cmp.mapping.preset.insert({
        ["<C-Space>"] = cmp.mapping.complete(),            -- Trigger completion
        ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Confirm selection
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          else
            fallback()
          end
        end, { "i", "s" }),
      })

      return opts
    end,
  },
}
