-- Requirements:
--   - sharkdp/fd: `brew install fd`
--   - BurntSushi/ripgrep: `brew install ripgrep`

return {
  "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
    },
}