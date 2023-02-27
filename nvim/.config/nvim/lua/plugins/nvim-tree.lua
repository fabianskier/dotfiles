return {
  "DaikyXendo/nvim-tree.lua",
    dependencies = {
      "kyazdani42/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup({
        sort_by = "case_sensitive",
        open_on_setup = true,
        view = {
          adaptive_size = true,
          mappings = {
            list = {
              { key = "u", action = "dir_up" },
            },
          },
        },
        renderer = {
          group_empty = true,
        },
      })
    end,
}
