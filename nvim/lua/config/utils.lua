local M = {}

M.lsps = {
  "ruff",
  "lua_ls",
  "texlab",
  "clangd",
  "nixd"
}

M.lsp_severity = {
  vim.diagnostic.severity.ERROR,
  vim.diagnostic.severity.INFO,
  vim.diagnostic.severity.HINT
}

return M
