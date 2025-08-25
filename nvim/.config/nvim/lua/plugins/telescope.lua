return {
  "nvim-telescope/telescope.nvim", -- plugin repo
  tag = "0.1.5", -- optional, pick stable release
  dependencies = { "nvim-lua/plenary.nvim" }, -- telescope needs plenary
  config = function()
    local telescope = require("telescope")
    telescope.setup({
      defaults = {
        layout_strategy = "horizontal",
        sorting_strategy = "ascending",
        prompt_prefix = "🔍 ",
      },
    })

    -- Keymaps for Telescope
    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[F]ind [F]iles" })
    vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "[F]ind by [G]rep" })
    vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "[F]ind [B]uffers" })
    vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "[F]ind [H]elp" })
  end,
}
