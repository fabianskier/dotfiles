return {
  "tpope/vim-fugitive",
  "tpope/vim-rhubarb",
  "lewis6991/gitsigns.nvim",
    opts = {
      signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
      },
    },
    "kdheepak/lazygit.nvim",
    keys = {{"<leader>gg", ":LazyGit<cr>"}},
}