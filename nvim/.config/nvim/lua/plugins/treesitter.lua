return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate", -- auto-update parsers
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("nvim-treesitter.configs").setup({
        -- Languages to install
        ensure_installed = {
          "lua",
          "vim",
          "vimdoc",
          "query",
          "bash",
          "python",
          "javascript",
          "html",
          "css",
          "json",
          "c",
          "cpp",
        },

        -- Enable syntax highlighting
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },

        -- Enable indentation based on treesitter
        indent = { enable = true },

        -- Optional: incremental selection
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
          },
        },
      })
    end,
  },
}
