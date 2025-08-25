return {
  {
    "tpope/vim-fugitive",
    cmd = { "Git", "G" }, -- lazy-load only when using :Git
    keys = {
      { "<leader>gs", "<cmd>Git<CR>", desc = "Git status" },
      { "<leader>gc", "<cmd>Git commit<CR>", desc = "Git commit" },
      { "<leader>gp", "<cmd>Git push<CR>", desc = "Git push" },
      { "<leader>gl", "<cmd>Git pull<CR>", desc = "Git pull" },
    },
  },
}
