require("nvchad.configs.lspconfig").defaults()

-- local servers = { "html", "cssls", "lua_ls", "jsonls", "taplo", "pyright" }
-- vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers

local servers = {
  html = {},
  cssls = {},
  lua_ls = {},
  jsonls = {},
  taplo = {},

  pyright = {
    settings = {
      python = {
        analysis = {
          autoSearchPaths = true,
          typeCheckingMode = "off",
        },
      },
    },
  },
}

for name, opts in pairs(servers) do
  vim.lsp.config(name, opts)
  vim.lsp.enable(name)
end

-- if you dont want to call the enable method in the loop, just pass a table.
-- vim.lsp.enable(vim.tbl_keys(servers))
-- vim.lsp.enable({"pyright", "clangd"})
