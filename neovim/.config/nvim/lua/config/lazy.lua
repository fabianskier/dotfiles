-- Lazy.nvim Plugin Manager

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Plugin specifications
local plugins = {
  -- Catppuccin colorscheme
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        transparent_background = false,
      })
      vim.cmd("colorscheme catppuccin")
    end,
  },

  -- Oil.nvim - File explorer
  {
    "stevearc/oil.nvim",
    opts = {
      default_file_explorer = true,
    },
    config = function(_, opts)
      require("oil").setup(opts)
      vim.keymap.set("n", "-", require("oil").open, { noremap = true, silent = true })
    end,
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  -- Web Devicons (required by oil)
  {
    "nvim-tree/nvim-web-devicons",
  },

  -- Vim-tmux-navigator - Seamless navigation between tmux and vim
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
}

require("lazy").setup(plugins)
