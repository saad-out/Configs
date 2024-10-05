-- Use 'return {...}' to define the plugin list
return {
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local function on_attach(bufnr)
        local api = require("nvim-tree.api")

        local function opts(desc)
          return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end

        -- Default mappings
        api.config.mappings.default_on_attach(bufnr)

        -- Custom mappings
        vim.keymap.set("n", "<C-t>", api.tree.change_root_to_parent, opts("Up"))
        vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
      end

      require("nvim-tree").setup({
        sort_by = "case_sensitive",
        view = {
          width = 30,
        },
        renderer = {
          group_empty = true,
        },
        filters = {
          dotfiles = true,
        },
        on_attach = on_attach,
      })

      -- Auto open tree when starting Neovim
      -- local function open_nvim_tree(data)
      --   -- buffer is a real file on the disk
      --   local real_file = vim.fn.filereadable(data.file) == 1
      --
      --   -- buffer is a [No Name]
      --   local no_name = data.file == "" and vim.bo[data.buf].buftype == ""
      --
      --   if not real_file and not no_name then
      --     return
      --   end
      --
      --   -- open the tree, find the file but don't focus it
      --   require("nvim-tree.api").tree.toggle({ focus = false, find_file = true })
      -- end
      --
      -- vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

      -- Optional: Add a keymap to toggle NvimTree
      vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
    end,
  },
  -- Ensure nvim-web-devicons is loaded
  {
    "nvim-tree/nvim-web-devicons",
    config = function()
      require("nvim-web-devicons").setup({
        -- Override any default options here if needed
      })
    end,
  },
  -- Tokyonight theme (blueish)
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        style = "storm", -- The main blue variant
        light_style = "day", -- The light variant if you switch to light mode
        transparent = false, -- Enable this for a transparent background
        terminal_colors = true,
        styles = {
          comments = { italic = true },
          keywords = { italic = true },
          functions = {},
          variables = {},
          sidebars = "dark",
          floats = "dark",
        },
        sidebars = { "qf", "help" },
        day_brightness = 0.3,
        hide_inactive_statusline = false,
        dim_inactive = false,
        lualine_bold = false,
      })

      vim.cmd([[colorscheme tokyonight]])
    end,
  },
  -- Treesitter for syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "python", "javascript", "html", "css", "lua", "bash" }, -- Add your desired languages
        highlight = { enable = true },
      })
    end,
  },
}
