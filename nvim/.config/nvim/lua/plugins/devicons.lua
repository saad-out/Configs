return {
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true, -- loads when another plugin requires it
    config = function()
      require("nvim-web-devicons").setup({
        -- optionally override some icons
        override = {
          zsh = {
            icon = "",
            color = "#428850",
            name = "Zsh",
          },
        },
        default = true, -- enable default icons
      })
    end,
  },
}
