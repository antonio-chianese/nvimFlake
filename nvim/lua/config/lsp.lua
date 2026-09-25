local utils = require("config.utils")

vim.lsp.config("clangd", {
  cmd = { "clangd" },
  filetypes = { "c", "h", "cpp" }
})

vim.lsp.config("lua_ls", {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  -- settings = {
  --   Lua = {
  --     diagnostics = {
  --       globals = { "vim" }
  --     }
  --   }
  -- }
})

vim.lsp.config("texlab", {
  cmd = { "texlab" },
  filetypes = { "tex" }
})

vim.lsp.config("ruff", {
  cmd = { "ruff", "server" },
  filetypes = { "python" }
})

vim.lsp.config("nixd", {
  cmd = { "nixd" },
  filetypes = { "nix" }
})

vim.lsp.enable(utils.lsps)

-- vim.diagnostic.enable(true)

vim.diagnostic.config({
  virtual_lines = false,
  update_in_insert = true,
  float = {
    border = "rounded",
    source = true,
  },
  virtual_text = {
    severity = utils.lsp_severity
  },
  underline = {
    severity = utils.lsp_severity
  },
  signs = {
    severity = utils.lsp_severity
  }
})

vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
-- vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})

vim.g.python_recommended_style = 0  -- no default 4-spaces python indentation

-- vim.keymap.set('n', 'gK', function()
--   local new_config = not vim.diagnostic.config().virtual_text
--   vim.diagnostic.config({ virtual_text = new_config })
-- end, { desc = 'Toggle diagnostic virtual_lines' })
