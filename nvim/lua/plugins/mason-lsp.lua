return {
  -- Mason-LSPConfig: bridge between Mason and LSPConfig
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "neovim/nvim-lspconfig" },
    config = function()
      local lspconfig = require("lspconfig")

      -- Setup mason-lspconfig
      require("mason-lspconfig").setup({
        ensure_installed = {
          -- Core DevOps / scripting
          "bashls",
          "dockerls",
          "docker_compose_language_service",
          "yamlls",
          "jsonls",
          "ansiblels",
          "terraformls",
          "tflint",

          -- Web Dev basics
          "html",
          "cssls",
          -- "tsserver", // Not a valid enty !

          -- Backend languages
          "pyright", -- Python
          -- "gopls", -- Go
          "clangd", -- C, C++
          "rust_analyzer", -- Rust
          "lua_ls", -- Lua (for Neovim itself)
          -- "typescript_language_server", // Not a valid entry !
        },
      })

      -- Common on_attach function for keymaps
      local on_attach = function(_, bufnr)
        local opts = { buffer = bufnr, silent = true }
        local map = vim.keymap.set
        map("n", "gd", vim.lsp.buf.definition, opts)
        map("n", "gr", vim.lsp.buf.references, opts)
        map("n", "K", vim.lsp.buf.hover, opts)
        map("n", "<leader>rn", vim.lsp.buf.rename, opts)
        map("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        map("n", "[d", vim.diagnostic.goto_prev, opts)
        map("n", "]d", vim.diagnostic.goto_next, opts)
        map("n", "<leader>f", function()
          vim.lsp.buf.format({ async = true })
        end, opts)
      end

      -- Capabilities (for completion plugins like nvim-cmp)
      -- local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local capabilities = vim.lsp.protocol.make_client_capabilities()

      -- Setup servers
      require("mason-lspconfig").setup_handlers({
        function(server_name)
          lspconfig[server_name].setup({
            on_attach = on_attach,
            capabilities = capabilities,
          })
        end,
      })
    end,
  },
}
