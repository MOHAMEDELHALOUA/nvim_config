return {
  {
    "williamboman/mason.nvim",
    version = "v1.10.0",
    config = function()
      require("mason").setup()
    end
  },
  {
    'williamboman/mason-lspconfig.nvim',
    version = "v1.29.0",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {"lua_ls", "clangd", "pyright"},
        automatic_installation = true,
      })
    end,
    dependencies = {'williamboman/mason.nvim'}
  },
  {
    'neovim/nvim-lspconfig',
    version = "v0.1.8",
    dependencies = {'williamboman/mason-lspconfig.nvim'},
    config = function()

      local lspconfig = require("lspconfig")
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      require('lspconfig').lua_ls.setup({
        settings = {
          Lua = {
            diagnostics = {
              globals = {"vim"}
            }
          }
        }
      })

      lspconfig.clangd.setup({
        capabilities = capabilities
      })
      lspconfig.pyright.setup({
        capabilities = capabilities
      })
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
      vim.keymap.set('n', 'gd' , vim.lsp.buf.definition, {})
      vim.keymap.set({'n'}, '<leader>ac', vim.lsp.buf.code_action , {})
    end
  }
}
