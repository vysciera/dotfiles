-- ============================================================
-- LSP
-- ============================================================

-- ------------------------------------------------------------
-- Global configuration
-- ------------------------------------------------------------

vim.lsp.config("*", {
  capabilities = {
    textDocument = {
      semanticTokens = {
        multilineTokenSupport = true,
      },
    },
  },

  root_markers = { ".git" },
})

vim.diagnostic.config({
  virtual_text = {
    spacing = 2,
    prefix = "●",
  },

  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "",
      [vim.diagnostic.severity.WARN]  = "",
      [vim.diagnostic.severity.INFO]  = "",
      [vim.diagnostic.severity.HINT]  = "󰌵",
    },
  },

  underline = true,
  update_in_insert = false,
  severity_sort = true,

  float = {
    border = "rounded",
    source = true,
  },
})


-- ------------------------------------------------------------
-- Lua
-- ------------------------------------------------------------

vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
      },

      diagnostics = {
        globals = {
          "vim",
        },
      },

      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },

      telemetry = {
        enable = false,
      },
    },
  },
})


-- ------------------------------------------------------------
-- Go
-- ------------------------------------------------------------

vim.lsp.config("gopls", {
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
        shadow = true,
      },

      staticcheck = true,

      gofumpt = true,
    },
  },
})


-- ------------------------------------------------------------
-- Rust
-- ------------------------------------------------------------

vim.lsp.config("rust_analyzer", {
  settings = {
    ["rust-analyzer"] = {
      check = {
        command = "clippy",
      },
    },
  },
})


-- ------------------------------------------------------------
-- C / C++
-- ------------------------------------------------------------

vim.lsp.config("clangd", {
  cmd = {
    "clangd",
    "--background-index",
    "--clang-tidy",
  },
})


-- ------------------------------------------------------------
-- Enable
-- ------------------------------------------------------------

vim.lsp.enable({
  "lua_ls",
  "gopls",
  "rust_analyzer",
  "clangd",
})
