local capabilities = require("cmp_nvim_lsp").default_capabilities()
local config = require("lspconfig")

-- Lua
config.lua_ls.setup({
  capabilities = capabilities,
  root_dir = function()
    return vim.loop.cwd()
  end,
  settings = {
    Lua = {
      completion = {
        callSnippet = "Replace",
      },
    },
  },
})

-- JSON
config.jsonls.setup({
  capabilities = capabilities,
  settings = {
    json = {
      schemas = require("schemastore").json.schemas(), -- use SchemaStore to get autocompletion in a wide set of .json files
      validate = { enable = true },
    },
  },
})

-- YAML
config.yamlls.setup({
  settings = {
    yaml = {
      schemaStore = {
        -- You must disable built-in schemaStore support if you want to use
        -- this plugin and its advanced options like `ignore`.
        enable = false,
        -- Avoid TypeError: Cannot read properties of undefined (reading 'length')
        url = "",
      },
      schemas = require("schemastore").yaml.schemas(), -- use SchemaStore to get autocompletion in a wide set of .yaml/.yml files
    },
  },
})

local onlyCapabilities = {
  capabilities = capabilities,
}

-- Go
require("lspconfig").gopls.setup(onlyCapabilities)

-- Dockerfile
require("lspconfig").dockerls.setup(onlyCapabilities)

-- Docker Compose file
require("lspconfig").docker_compose_language_service.setup(onlyCapabilities)

-- Vimscript
require("lspconfig").vimls.setup(onlyCapabilities)

-- Bash
require("lspconfig").bashls.setup(onlyCapabilities)

-- Javascript & Typescript
require("lspconfig").tsserver.setup(onlyCapabilities)

-- Nix
require("lspconfig").nixd.setup(onlyCapabilities)
