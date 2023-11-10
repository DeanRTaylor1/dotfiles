local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")
local util = require "lspconfig/util"

lspconfig.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {"gopls"},
  filetypes = { "go", "gomod", "gowork", "gotmpl"},
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
      },
    },
  },
}

lspconfig.tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {"typescript-language-server", "--stdio"},
  filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript", "javascriptreact"},
  root_dir = util.root_pattern("package.json", "tsconfig.json", ".git"),
  settings = {
    documentFormatting = true, -- Enable/disable formatting feature
  },
}

local servers = {
  "html", "cssls", "clangd", -- Existing servers
  "tsserver", -- TypeScript and JavaScript
  "rust_analyzer", -- Rust
  "ocamllsp", -- OCaml
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end
