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

  -- Your existing plugins here...

  -- Autocompletion plugin
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp", -- LSP completion source
      "hrsh7th/cmp-buffer", -- Buffer completion source
      "hrsh7th/cmp-path", -- Path completion source
      "hrsh7th/cmp-cmdline", -- Command-line completion
      "L3MON4D3/LuaSnip", -- Snippet engine
      "saadparwaiz1/cmp_luasnip", -- Snippet completions
      "rafamadriz/friendly-snippets", -- Preconfigured snippets
    },
    config = function()
      -- Set up nvim-cmp.
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      -- Load VSCode-like snippets from friendly-snippets
      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body) -- For `luasnip` users.
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-n>"] = cmp.mapping.select_next_item(),
          ["<C-p>"] = cmp.mapping.select_prev_item(),
          ["<C-d>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.close(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item.
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" }, -- For luasnip users.
        }, {
          { name = "buffer" },
        }),
      })

      -- Set configuration for specific filetypes
      cmp.setup.filetype("gitcommit", {
        sources = cmp.config.sources({
          { name = "cmp_git" }, -- You can specify the `cmp_git` source if you were using it.
        }, {
          { name = "buffer" },
        }),
      })

      -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline({ "/", "?" }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" },
        },
      })

      -- Use cmdline & path source for ':'.
      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" },
        }, {
          { name = "cmdline" },
        }),
      })
    end,
  },

  -- LSP support (Language Server Protocol)
  {
    "neovim/nvim-lspconfig",
    config = function()
      -- Setup LSP servers
      local lspconfig = require("lspconfig")

      -- Example for Python LSP
      lspconfig.pyright.setup({})

      -- Example for JavaScript/TypeScript LSP
      lspconfig.tsserver.setup({})
    end,
  },
  -- Mason for managing LSP servers, DAP, linters, and formatters
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },

  -- Mason-LSPConfig to integrate Mason with nvim-lspconfig
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "neovim/nvim-lspconfig" },
    config = function()
      require("mason-lspconfig").setup({
        -- ensure_installed = { "pyright", "tsserver", "bashls" }, -- Auto-install these servers
        automatic_installation = true, -- Automatically install any LSP server
      })

      -- Auto-configure installed LSP servers
      local lspconfig = require("lspconfig")
      require("mason-lspconfig").setup_handlers({
        -- function(server_name) -- Default handler for all servers
        --   lspconfig[server_name].setup({})
        -- end,
        function(server_name)
          lspconfig[server_name].setup({
            -- On_attach function for key mappings
            on_attach = function(client, bufnr)
              local function buf_set_keymap(...)
                vim.api.nvim_buf_set_keymap(bufnr, ...)
              end
              local opts = { noremap = true, silent = true }

              -- Hover documentation
              buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)

              -- Add other keybindings if needed
              buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
              buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
            end,
          })
        end,
        vim.cmd([[
            " autocmd CursorHold * lua vim.lsp.buf.hover()
        ]]),
      })
    end,
  },
  -- GitHub Copilot plugin
  {
    "github/copilot.vim",
    config = function()
      -- Disable the default tab mapping to avoid conflicts with nvim-cmp
      vim.g.copilot_no_tab_map = true
      -- Map Ctrl-J to accept Copilot suggestions
      vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
    end,
  },

  -- Git integration
  {
    "tpope/vim-fugitive",
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({})
    end,
  },
}
