-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end


return {
  "neovim/nvim-lspconfig",
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",

      -- Useful status updates for LSP
      -- NOTE: `opts = {}` is the same as calling `require("fidget").setup({})`
      { "j-hui/fidget.nvim", opts = {} },

      -- Additional lua configuration, makes nvim stuff amazing!
      "folke/neodev.nvim",
    },
    config = function()
      require("mason").setup()
      -- TODO: Create a function to automatically setup all LSPs
      require("mason-lspconfig").setup({
        ensure_installed = {
          "bashls",
          "clangd",
          "cmake",
          "dockerls",
          "docker_compose_language_service",
          "elixirls",
          "graphql",
          "jsonls",
          "jdtls",
          "lua_ls",
          "marksman",
          "pyright",
          "ruby_ls",
          "sqlls",
          "tsserver",
          "yamlls",
        },
      })
      require("lspconfig").bashls.setup {
        on_attach = on_attach
      }
      require("lspconfig").clangd.setup {
        on_attach = on_attach
      }
      require("lspconfig").cmake.setup {
        on_attach = on_attach
      }
      require("lspconfig").dockerls.setup {
        on_attach = on_attach
      }
      require("lspconfig").docker_compose_language_service.setup {
        on_attach = on_attach
      }
      require("lspconfig").elixirls.setup {
        on_attach = on_attach
      }
      require("lspconfig").graphql.setup {
        on_attach = on_attach
      }
      require("lspconfig").jsonls.setup {
        on_attach = on_attach
      }
      require("lspconfig").jdtls.setup {
        on_attach = on_attach
      }
      require("lspconfig").lua_ls.setup {
        on_attach = on_attach
      }
      require("lspconfig").marksman.setup {
        on_attach = on_attach
      }
      require("lspconfig").pyright.setup {
        on_attach = on_attach
      }
      require("lspconfig").ruby_ls.setup {
        on_attach = on_attach
      }
      require("lspconfig").sqlls.setup {
        on_attach = on_attach
      }
      require("lspconfig").tsserver.setup {
        on_attach = on_attach
      }
      require("lspconfig").yamlls.setup {
        on_attach = on_attach
      }
      require("neodev").setup()
    end,
}