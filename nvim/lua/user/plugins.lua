local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git", -- A modern plugin manager for Neovim
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	'tpope/vim-fugitive', -- A Git wrapper so awesome, it should be illegal
  'tpope/vim-rhubarb', -- GitHub extension for fugitive.vim
	'tpope/vim-sleuth', -- Heuristically set buffer options

	{
    'neovim/nvim-lspconfig', -- Quickstart configs for Nvim LSP
    dependencies = {
      'williamboman/mason.nvim', -- Easily install and manage LSP servers, DAP servers, linters, and formatters
      'williamboman/mason-lspconfig.nvim', -- Extension to mason.nvim that makes it easier to use lspconfig with mason.nvim.
      { 'j-hui/fidget.nvim', opts = {} }, -- Standalone UI for nvim-lsp progress
      'folke/neodev.nvim', -- Neovim setup for init.lua and plugin development with full signature help, docs and completion for the nvim lua API.
    },
  },

	{
    'hrsh7th/nvim-cmp', -- A completion plugin for neovim coded in Lua.
    dependencies = { 
			'hrsh7th/cmp-nvim-lsp', -- nvim-cmp source for neovim builtin LSP client
			'L3MON4D3/LuaSnip', -- Snippet Engine for Neovim written in Lua.
			'saadparwaiz1/cmp_luasnip' -- luasnip completion source for nvim-cmp
		},
  },

	{ 'folke/which-key.nvim', opts = {} }, -- WhichKey is a lua plugin for Neovim 0.5 that displays a popup with possible keybindings of the command you started typing.

	{ 
    'lewis6991/gitsigns.nvim', -- Git integration for buffers
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },

	{
    'nvim-lualine/lualine.nvim', -- A blazing fast and easy to configure neovim statusline plugin written in pure lua.
    opts = {
      options = {
        icons_enabled = false,
        theme = 'onedark',
        component_separators = '|',
        section_separators = '',
      },
    },
  },
})
