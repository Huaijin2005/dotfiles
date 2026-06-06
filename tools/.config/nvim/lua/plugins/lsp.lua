return {
  -- mason: download lsp
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {},
    },
  },

  -- nvim-lspconfig & blink.cmp: configuration for lsp & code completion
  {
    "neovim/nvim-lspconfig",
    dependencies = { "saghen/blink.cmp" },
    config = function()
      local capabilities = require(blink.cmp).get_lsp_capabilities()
      local lspconfig = require("lspconfig")

      lspconfig["lua_ls"].set_up({ capabilities = capabilities })
    end,
  },
}
