-- lua/plugins/colorscheme.lua
return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "night", -- available: "storm", "night", "moon", "day"
      transparent = false,
      terminal_colors = true,
    },
  },
}
