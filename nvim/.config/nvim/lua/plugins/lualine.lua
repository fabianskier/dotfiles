return {
  "nvim-lualine/lualine.nvim",

  config = function()
    require("lualine").setup {
      options = {
        theme = "nightfox",
      },
      sections = {
  lualine_c = {
    {
      'filename',
      path = 3,
    }
  }
}
    }
    end,
}
