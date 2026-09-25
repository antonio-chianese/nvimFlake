-- return {
--   "gruvbox.nvim",
--   colorscheme = "gruvbox",
--
--   keys = {
--     { "<leader>p", "<cmd>lua print(vim.inspect(require('gruvbox').palette))<CR>", desc = "Show palette" },
--     -- { "<leader>p", "<cmd>lua vim.fn.writefile(vim.inspect(require('gruvbox').palette), vim.fn.expand('%:h') .. '/palette.lua')<CR>", desc = "Save palette" },
--   },
--
--   after = function()
--     -- Variables:
--     local lightGreen = "#282e2e"
--
--     -- Options:
--     vim.o.background = "dark"
--
--     -- Setup:
--     require("gruvbox").setup({
--
--       transparent_background = false,
--       palette_overrides = {
--         bright_green = "#a9b665",
--         dark0 = "#212121", -- def: #3d4b3d
--         dark1 = "#1d2021", -- def: #3c3836 | last: #282e2e
--         bright_orange = "#b66375",
-- 	bright_yellow = "#a9b665",
-- 	bright_red = "#ca4e4e",
--
--         -- dark0_hard = "#1d2121",
--         -- dark0_soft = "#1d2121",
--       },
--
--       overrides = {
--         CursorLine = {bg = lightGreen},
--         CursorColumn = {bg = lightGreen},
--         ColorColumn = {bg = lightGreen},
--       }
--
--     })
--   end,
-- }

return {
  "gruvbox-material",
  colorscheme = "gruvbox-material",

  keys = {
    { "<leader>p", "<cmd>lua print(vim.inspect(require('gruvbox-material').palette))<CR>", desc = "Show palette" },
    -- { "<leader>p", "<cmd>lua vim.fn.writefile(vim.inspect(require('gruvbox').palette), vim.fn.expand('%:h') .. '/palette.lua')<CR>", desc = "Save palette" },
  },

  after = function()
    -- Style:
    vim.g.gruvbox_material_show_eob = 0
    vim.g.gruvbox_material_float_style = "blend"
    vim.g.gruvbox_material_diagnostic_virtual_text = "colored"

    -- Background:
    vim.g.gruvbox_material_transparent_background = 1 -- 2
    -- vim.g.gruvbox_material_background = "hard"
    -- vim.g.gruvbox_material_ui_contrast = "high"
    vim.g.gruvbox_material_colors_override = { bg0 = { "#212121", "234" } }

    -- Text:
    vim.g.gruvbox_material_enable_italic = true
    vim.g.gruvbox_material_enable_bold = true

  end,
}
