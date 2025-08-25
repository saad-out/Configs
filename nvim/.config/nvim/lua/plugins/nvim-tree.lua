return {
  {
    "nvim-tree/nvim-tree.lua",
    version = "*", -- optional: latest stable
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- optional, for icons
    config = function()
      require("nvim-tree").setup({})
    end,
  },
}
