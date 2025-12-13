local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    nginx = { "nginxfmt" },
    sh = { "beautysh" },
    css = { "prettier" },
    html = { "prettier" },
    toml = { "taplo" },
  },

  formatters = {
    taplo = {
      -- Vi tvingar taplo att köra med flaggan för indent_tables
      args = {
        "fmt",
        "-o",
        "indent_tables=true",
        "-o",
        "indent_entries=true",
        "-",
      },
    },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
